//
//  LocalCell.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/6/21.
//

import Foundation

class LocalConnection: Identifiable {
    var id = UUID()
    var state: String
    var host: String
    var clients: [String]
    var time: String
    
    init(time: String, state: String, host: String, client: [String]) {
        self.time = time
        self.state = state
        self.host = host
        self.clients = client
    }
    
}
