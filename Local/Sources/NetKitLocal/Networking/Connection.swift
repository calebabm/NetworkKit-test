//
//  Connection.swift
//  
//
//  Created by Caleb Meurer on 1/18/22.
//

import Foundation
import Network
import Combine

@available(macOS 14.0, *)
public class Connection {
    
    private(set) var connection: NWConnection
    @Published var state: NWConnection.State?
    
    func handleConnection() {
        connection.stateUpdateHandler = { state in
            self.state = state
        }
        connection.start(queue: .global(qos: .default))
    }
    
    init(connection: NWConnection) {
        self.connection = connection
        handleConnection()
    }
}
