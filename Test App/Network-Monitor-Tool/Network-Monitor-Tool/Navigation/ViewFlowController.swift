//
//  ViewFlowController.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/28/21.
//

import Foundation

class ViewFlowController<T> {
    var view: T
    
    init(view: T) {
        self.view = view
    }
}
