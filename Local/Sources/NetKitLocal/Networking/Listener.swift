//
//  Listener.swift
//  
//
//  Created by Caleb Meurer on 1/18/22.
//

import Foundation
import Network
import Combine

@available(macOS 14.0, *)
class Listener: ObservableObject {
    
    private(set) var listener: NWListener?
    private(set) var cancellable: AnyCancellable?
    @Published var state: NWListener.State?
    @Published var newConnectionState: NWConnection.State?
    @Published var newConnection: Connection?
    
    private func startListening() {
        listener?.stateUpdateHandler = { state in
            self.state = state
        }
        handleNewConnection()
        listener?.start(queue: .global(qos: .default))
    }
    
    private func handleNewConnection() {
        listener?.newConnectionHandler = { connection in
            self.newConnection = Connection(connection: connection)
            self.cancellable = self.newConnection?.$state.sink(receiveValue: { newConnectionState in
                newConnectionState.flatMap { state in
                    self.newConnectionState = state
                }
            })
        }
    }
    
    init(_ parameters: NWParameters, _ port: NWEndpoint.Port) {
        parameters.allowLocalEndpointReuse = true
        self.listener = try? NWListener(using: parameters, on: port)
        startListening()
    }
}
