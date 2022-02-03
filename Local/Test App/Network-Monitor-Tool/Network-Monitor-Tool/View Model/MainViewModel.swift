//
//  MainViewModel.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/1/21.
//

import SwiftUI

final class MainViewModel {
    private(set) var coordinator: Coordinator
    
    var dataSource = [
        CellData(title: "Local"),
        CellData(title: "Server")
    ]
    
    func selected(cell: CellData) -> AnyView {
        if cell.title == "Local" {
            coordinator.updateState(state: .localView)
        } else {
            coordinator.updateState(state: .serverView)
        }
        
        let viewFlowController = coordinator.router.viewFlowController
        return viewFlowController.view
    }
    
    required init(_ coordinator: Coordinator) {
        self.coordinator = coordinator
    }
}
