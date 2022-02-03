//
//  LocalViewModel.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/1/21.
//

import SwiftUI

final class LocalViewModel {
    private(set) var coordinator: Coordinator
    private(set) var networkService: NetworkService
    
    var addTapped: some View {
        return AddLocalConnectionView()
    }
    
    var localConnections = [
        LocalConnection(time: "12:18", state: "Online", host: "172.20.10.3", client: ["192.168.86.170"]),
        LocalConnection(time: "12:17", state: "Offline", host: "172.20.10.3", client: ["192.168.86.170"]),
        LocalConnection(time: "12:15", state: "Offline", host: "172.20.10.3", client: ["192.168.86.170"]),
        LocalConnection(time: "12:15", state: "Offline", host: "172.20.10.3", client: ["192.168.86.170"]),
        LocalConnection(time: "12:15", state: "Offline", host: "172.20.10.3", client: ["192.168.86.170"]),
        LocalConnection(time: "12:15", state: "Offline", host: "172.20.10.3", client: ["192.168.86.170"]),
        LocalConnection(time: "12:15", state: "Offline", host: "172.20.10.3", client: ["192.168.86.170"]),
        LocalConnection(time: "12:10", state: "Offline", host: "172.20.10.3", client: ["192.168.86.170", "192.168.86.170", "192.168.86.170"]),
        LocalConnection(time: "12:02", state: "Offline", host: "172.20.10.3", client: ["192.168.86.170", "192.168.86.170", "192.168.86.170"]),
        LocalConnection(time: "12:02", state: "Offline", host: "172.20.10.3", client: ["192.168.86.170", "192.168.86.170", "192.168.86.170"]),
        LocalConnection(time: "12:02", state: "Offline", host: "172.20.10.3", client: ["192.168.86.170", "192.168.86.170", "192.168.86.170"]),
        LocalConnection(time: "12:02", state: "Offline", host: "172.20.10.3", client: ["192.168.86.170", "192.168.86.170", "192.168.86.170"]),
        LocalConnection(time: "12:02", state: "Offline", host: "172.20.10.3", client: ["192.168.86.170", "192.168.86.170", "192.168.86.170"]),
        LocalConnection(time: "12:02", state: "Offline", host: "172.20.10.3", client: ["192.168.86.170", "192.168.86.170", "192.168.86.170"]),
        LocalConnection(time: "12:02", state: "Offline", host: "172.20.10.3", client: ["192.168.86.170", "192.168.86.170", "192.168.86.170"]),
        LocalConnection(time: "12:02", state: "Offline", host: "172.20.10.3", client: ["192.168.86.170", "192.168.86.170", "192.168.86.170"])
    ]
    
    required init(_ coordinator: Coordinator, _ networkService: NetworkService) {
        self.coordinator = coordinator
        self.networkService = networkService
    }
}
