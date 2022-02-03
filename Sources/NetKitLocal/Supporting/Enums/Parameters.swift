//
//  File.swift
//  
//
//  Created by Caleb Meurer on 2/2/22.
//

import Foundation
import Network

@available(macOS 14.0, *)
enum Parameters {
    case defaultTcp
    case custom(parameters: NWParameters)
    
    var value: NWParameters {
        switch self {
        case .defaultTcp:
            return .tcp
        case .custom(let parameters):
            return parameters
        }
    }
}
