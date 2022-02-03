//
//  Router.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/28/21.
//

import SwiftUI

struct Router {
    var viewFlowController: ViewFlowController<AnyView>
    
    mutating func constructDependencies(_ state: AppState) {
        switch state {
        case .initialLaunch:
            //TODO: Construct the dependencies for the view with the dependency container
            let mainViewModel = MainViewModel(Coordinator(router: self))
            let viewController = MainView(mainViewModel)
            viewFlowController.view = AnyView(viewController)
        case .localView:
            let localViewModel = LocalViewModel(Coordinator(router: self), NetworkService())
            let viewController = LocalView(localViewModel)
            viewFlowController.view = AnyView(viewController)
        case .serverView:
            let serverViewModel = ServerViewModel(Coordinator(router: self), NetworkService())
            let viewController = ServerView(serverViewModel)
            viewFlowController.view = AnyView(viewController)
        }
    }
}
