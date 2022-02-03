//
//  File.swift
//  
//
//  Created by Caleb Meurer on 1/28/22.
//

import Foundation
import Combine

@available(macOS 14.0, *)
public protocol LocalNetworkable {
    var connectionStateCancellable: AnyCancellable? { get set }
    var publishedConnections: [String : Connection] { get set }
}
