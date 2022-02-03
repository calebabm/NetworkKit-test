//
//  File.swift
//  
//
//  Created by Caleb Meurer on 1/28/22.
//

import Foundation

@available(macOS 14.0, *)
public enum Services {
    case host
    case client
    case hostAndClient
    
    var value: Set<ServiceType> {
        switch self {
        case .host:
            return [.host]
        case .client:
            return [.client]
        case .hostAndClient:
            return [.host, .client]
        }
    }
}

@available(macOS 14.0, *)
public enum ServiceType {
    case host
    case client
    
    public var service: LocalNetworkable {
        switch self {
        case .host:
            return HostService()
        case .client:
            return ClientService()
        }
    }
}
