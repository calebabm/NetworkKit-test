//
//  LocalNetworkService.swift
//  
//
//  Created by Caleb Meurer on 1/13/22.
//

import Foundation
import Network
import Combine

@available(macOS 14.0, *)
public class LocalNetworkService {
    
    public var serviceType: Services
    public var connections: [String: Connection] = [:]
    private(set) var hostService: HostService? = nil
    private(set) var clientService: ClientService? = nil
    private(set) var cancellable: AnyCancellable?
    
    //MARK: Host
    public func hostConnections(on portNumber: UInt16) throws {
        hostService = HostService()
        hostService?.hostConnections(on: portNumber, completion: { try $0.flatMap { throw $0 }})
        subscribeToHostIncomingConnections()
    }
    
    private func subscribeToHostIncomingConnections() {
        self.cancellable = self.hostService?.$publishedConnections.sink(receiveValue: { publishedConnections in
            self.subscribe(for: .host)
        })
    }
    
    //MARK: Client
    public func establishConnection(to ipString: String, on portNumber: UInt16) throws {
        clientService = ClientService()
        clientService?.connectToDevice(ipString: ipString, on: portNumber, completion: { try $0.flatMap { throw $0 }})
        subscribeToClientConnectionState()
    }
    
    private func subscribeToClientConnectionState() {
        self.cancellable = self.clientService?.$publishedConnections.sink(receiveValue: { publishedConnection in
            self.subscribe(for: .client)
        })
    }
    
    private func subscribe(for serviceType: ServiceType) {
        switch serviceType {
        case .host:
            if let publisherSuper = serviceType.service as? HostService {
                self.cancellable = publisherSuper.$publishedConnections.sink(receiveValue: { publishedConnections in
                    self.checkForExistingConnections(publishedOutput: publishedConnections)
                })
            }
        case .client:
            if let publisherSuper = serviceType.service as? ClientService {
                self.cancellable = publisherSuper.$publishedConnections.sink(receiveValue: { publishedConnection in
                    self.checkForExistingConnections(publishedOutput: publishedConnection)
                })
            }
        }
    }
    
    private func checkForExistingConnections(publishedOutput: Published<[String : Connection]>.Publisher.Output) {
        publishedOutput.forEach { element in
            if !self.connections.contains(where: { element.key == $0.key }) {
                self.connections[element.key] = element.value
            }
        }
    }
    
    public init(_ serviceType: Services) {
        self.serviceType = serviceType
        serviceType.value.forEach { serviceType in
            switch serviceType {
            case .host:
                self.hostService = serviceType.service as? HostService
            case .client:
                self.clientService = serviceType.service as? ClientService
            }
        }
    }
}
