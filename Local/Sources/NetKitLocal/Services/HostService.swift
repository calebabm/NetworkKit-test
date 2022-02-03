//
//  LocalHost.swift
//  
//
//  Created by Caleb Meurer on 1/26/22.
//

import Foundation
import Combine
import Network

@available(macOS 14.0, *)
class HostService: LocalNetworkable {
    
    private(set) var listener: Listener?
    private(set) var listenerStateCancellable: AnyCancellable?
    private(set) var connectionCancellable: AnyCancellable?
    var connectionStateCancellable: AnyCancellable?
    @Published var publishedConnections: [String : Connection] = [:]
    
    public func hostConnections(on portNumber: UInt16, _ parameters: Parameters = .defaultTcp, completion: @escaping (Error?) throws -> Void) {
        guard let port = NWEndpoint.Port(rawValue: portNumber) else {
            return
        }
        self.listener = Listener(parameters.value, port)
        self.listenerStateCancellable = listener?.$state.sink(receiveValue: { state in
            state.flatMap { state in
                switch state {
                case .failed(let error):
                    self.listener?.listener?.cancel()
                    try? completion(error)
                case .cancelled:
                    //TODO: Should add a retry count
                    self.hostConnections(on: portNumber) { _ in }
                default:
                    break
                }
            }
        })
        handleIncomingConnections(completion: completion)
    }
    
    private func handleIncomingConnections(completion: @escaping (Error?) throws -> Void) {
        self.connectionCancellable = self.listener?.$newConnection.sink(receiveValue: { connection in
            connection.flatMap { connection in
                switch connection.connection.endpoint {
                case .hostPort(host: let host, _):
                    self.publishedConnections["\(host)"] = connection
                default:
                    break
                }
            }
        })
        self.connectionStateCancellable = self.listener?.$newConnectionState.sink(receiveValue: { state in
            state.flatMap { state in
                print("Connection state: \n \(state)")
                switch state {
                case .failed(let error):
                    self.listener?.newConnection?.connection.cancel()
                    try? completion(error)
                default:
                    break
                }
            }
        })
    }
}
