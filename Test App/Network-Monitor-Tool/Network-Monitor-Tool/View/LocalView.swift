//
//  LocalView.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/1/21.
//

import SwiftUI

struct LocalView: View {
    
    private(set) var viewModel: LocalViewModel
    @State var addTapped = false
    
    var body: some View {
        ZStack {
            Color.offWhite
                .ignoresSafeArea(.all)
            createView()
        }
    }
    
    func presentAddAlert() -> some View {
        return AddLocalConnectionView()
    }
    
    func createView() -> some View {
        viewModel.networkService.hostIncomingConnections()
        let singleConnectionHeader =
        VStack {
            HStack {
                Text("State")
                    .padding()
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                Text("Host")
                    .padding()
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                Text("Clients")
                    .padding()
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                Text("Time")
                    .padding()
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            Text("Single Connections")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
        }
        
        return ScrollView {
            LazyVStack {
                Section(header: singleConnectionHeader) {
                    ForEach(viewModel.localConnections.filter { $0.clients.count == 1 }, id: \.id) { (localConnection) in
                        LocalRowView(localConnection: localConnection)
                    }
                }
                Section(header:
                            Text("Group Connections")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                            .padding(.top)) {
                    ForEach(viewModel.localConnections.filter { $0.clients.count > 1 }, id: \.id) { (localConnection) in
                        LocalRowView(localConnection: localConnection)
                    }
                }
            }
        }
        .background(Color.offWhite)
        .navigationTitle("Local Connections")
        .toolbar {
            Button {
                addTapped = true
            }
        label: {
            Text("+")
                .font(.system(size: 30))
        }
        .sheet(isPresented: $addTapped) {
            viewModel.addTapped
            }
        }
    }
    
    init(_ viewModel: LocalViewModel) {
        self.viewModel = viewModel
    }
}

struct LocalView_Previews: PreviewProvider {
    static var previews: some View {
        let viewFlowController = ViewFlowController(view: AnyView(EmptyView()))
        let router = Router(viewFlowController: viewFlowController)
        let viewModel = LocalViewModel(Coordinator(router: router), NetworkService())
        LocalView(viewModel)
    }
}
