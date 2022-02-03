//
//  MainView.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/1/21.
//

import SwiftUI

struct MainView: View {
    
    private(set) var viewModel: MainViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.offWhite
                    .ignoresSafeArea(.all)
                createView()
            }
        }
    }
    
    func createView() -> some View {
        return ScrollView {
            LazyVStack {
                ForEach(viewModel.dataSource, id: \.id) { (cell) in
                    MainViewCell(cellData: cell, destination: viewModel.selected(cell: cell))
                }
            }
        }
        .navigationTitle("Configure Connections")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    init(_ viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        let viewFlowController = ViewFlowController(view: AnyView(EmptyView()))
        let router = Router(viewFlowController: viewFlowController)
        let coordinator = Coordinator(router: router)
        let viewModel = MainViewModel(coordinator)
        MainView(viewModel)
    }
}
