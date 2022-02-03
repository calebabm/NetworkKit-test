//
//  Coordinator.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/1/21.
//

import SwiftUI

class Coordinator {
    
    var router: Router
    private(set) var appState: AppState = .initialLaunch {
        didSet {
            setup()
        }
    }
    
    func updateState(state: AppState) {
        self.appState = state
    }
    
    func setup() {
        self.router.constructDependencies(self.appState)
    }
    
    internal init(router: Router, appState: AppState = .initialLaunch) {
        self.router = router
        self.appState = appState
    }
}

