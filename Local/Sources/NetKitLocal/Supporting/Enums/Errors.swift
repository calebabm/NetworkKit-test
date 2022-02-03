//
//  File.swift
//  
//
//  Created by Caleb Meurer on 1/28/22.
//

import Foundation

@available(macOS 14.0, *)
enum ConnectionError: Error {
    case failed(message: String)
    case canceled(message: String)
    case unknown(message: String)
    
    var errorMessage: String {
        switch self {
        case .failed(let message):
            return message
        case .canceled(let message):
            return message
        case .unknown(let message):
            return message
        }
    }
}
