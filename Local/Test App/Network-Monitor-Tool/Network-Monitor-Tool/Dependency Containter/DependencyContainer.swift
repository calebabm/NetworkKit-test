//
//  DependencyContainer.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/1/21.
//

import Foundation

enum DependencyContainer<T> {
    case dependencies(_ services: T)
    
    //TODO: Possibly use a method to create dependencies rather than create variables and passing into ViewModel -> Coordinator
    
    var services: T {
        switch self {
        case .dependencies(let services):
            return services
        }
    }
}
