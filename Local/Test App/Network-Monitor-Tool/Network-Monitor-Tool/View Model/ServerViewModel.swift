//
//  ServerViewModel.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/2/21.
//

import SwiftUI

final class ServerViewModel {
    private(set) var coordinator: Coordinator
    private(set) var networkService: NetworkService
    
    var serverConnections = [
        ServerConnection(url: "revelup.com", requestType: "POST", status: "404", time: "12:10"),
        ServerConnection(url: "revelup.com", requestType: "GET", status: "200", time: "1:30"),
        ServerConnection(url: "revelup.com", requestType: "GET", status: "200", time: "2:33"),
        ServerConnection(url: "revelup.com", requestType: "GET", status: "200", time: "2:33"),
        ServerConnection(url: "revelup.com", requestType: "GET", status: "200", time: "2:33"),
        ServerConnection(url: "revelup.com", requestType: "GET", status: "200", time: "2:33"),
        ServerConnection(url: "revelup.com", requestType: "GET", status: "200", time: "2:33"),
        ServerConnection(url: "revelup.com", requestType: "GET", status: "200", time: "2:33"),
        ServerConnection(url: "revelup.com", requestType: "GET", status: "200", time: "2:33"),
        ServerConnection(url: "revelup.com", requestType: "GET", status: "200", time: "2:33"),
        ServerConnection(url: "revelup.com", requestType: "GET", status: "200", time: "2:33"),
        ServerConnection(url: "revelup.com", requestType: "GET", status: "200", time: "2:33"),
        ServerConnection(url: "revelup.com", requestType: "GET", status: "200", time: "2:33"),
        ServerConnection(url: "revelup.com", requestType: "GET", status: "200", time: "2:33")
    ]
    
    required init(_ coordinator: Coordinator, _ networkService: NetworkService) {
        self.coordinator = coordinator
        self.networkService = networkService
    }
}
