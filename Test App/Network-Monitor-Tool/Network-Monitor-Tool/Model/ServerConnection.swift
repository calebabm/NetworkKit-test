//
//  ServerCell.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/6/21.
//

import Foundation

class ServerConnection: Identifiable {
    var id = UUID()
    var url: String
    var requestType: String
    var status: String
    var time: String
    
    init(url: String, requestType: String, status: String, time: String) {
        self.url = url
        self.requestType = requestType
        self.status = status
        self.time = time
    }    
}
