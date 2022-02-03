//
//  LocalClient.swift
//  
//
//  Created by Caleb Meurer on 1/26/22.
//

import Foundation
import Combine
import Network

@available(macOS 14.0, *)
class ClientService: LocalNetworkable {
    
    var connectionStateCancellable: AnyCancellable?
    @Published var publishedConnections: [String : Connection] = [:]
    
    func connectToDevice(ipString: String, on portNumber: UInt16, _ parameters: Parameters = .defaultTcp, completion: @escaping (Error?) throws -> Void) {
        guard let ip = IPv4Address(ipString), let port = NWEndpoint.Port(rawValue: portNumber) else {
            return
        }
        let connection = Connection(connection: NWConnection(host: .ipv4(ip), port: port, using: parameters.value))
        self.publishedConnections[ipString] = connection
        self.connectionStateCancellable = self.publishedConnections[ipString]?.$state.sink(receiveValue: { state in
            state.flatMap { state in
                print("Connection state: \n \(state)")
                switch state {
                case .failed(let error):
                    connection.connection.cancel()
                    try? completion(error)
                default:
                    break
                }
            }
        })
    }
    
}
