//
//  ServerView.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/2/21.
//

import SwiftUI

struct ServerView: View {
    
    private(set) var viewModel: ServerViewModel
    @State var addTapped = false
    
    var body: some View {
        ZStack {
            Color.offWhite
                .ignoresSafeArea(.all)
            createView()
                .toolbar {
                    Button {
                        addTapped.toggle()
                    } label: {
                        Text("+")
                            .font(.system(size: 30))
                    }
                    
                }
        }
    }
    
    func createView() -> some View {
        let header =
        HStack {
            Text("URL")
                .padding()
                .font(.system(size: 14))
                .foregroundColor(.gray)
            Text("Request Type")
                .padding()
                .font(.system(size: 14))
                .foregroundColor(.gray)
            Text("Status")
                .padding()
                .font(.system(size: 14))
                .foregroundColor(.gray)
            Text("Time")
                .padding()
                .font(.system(size: 14))
                .foregroundColor(.gray)
        }.scaledToFit()
        
        return ScrollView {
            LazyVStack {
                Section(header: header) {
                    ForEach(viewModel.serverConnections, id: \.id) { (serverConnection) in
                        ServerRowView(serverConnection: serverConnection)
                    }
                }
                
            }
        }
        .navigationTitle("Server Requests")
    }
    
    init(_ viewModel: ServerViewModel) {
        self.viewModel = viewModel
    }
}

struct InternetView_Previews: PreviewProvider {
    static var previews: some View {
        let viewFlowController = ViewFlowController(view: AnyView(EmptyView()))
        let router = Router(viewFlowController: viewFlowController)
        let viewModel = ServerViewModel(Coordinator(router: router), NetworkService())
        ServerView(viewModel)
    }
}
