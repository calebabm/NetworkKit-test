//
//  ServerRowView.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/7/21.
//

import SwiftUI

struct ServerRowView: View {
    
    var serverConnection: ServerConnection
    @State var tapped = false
    
    var body: some View {
        let view =
        Section {
            NavigationLink(isActive: $tapped) {
                EmptyView()
            } label: {
                HStack {
                    Text(serverConnection.url)
                        .padding()
                        .font(.system(size: 12))
                    Text(serverConnection.requestType)
                        .padding()
                        .font(.system(size: 12))
                    Text(serverConnection.status)
                        .padding()
                        .font(.system(size: 12))
                    Text(serverConnection.time)
                        .font(.system(size: 12))
                }
            }
        }
        
        createNeumorphic(
            element: view,
            shape: RoundedRectangle(cornerRadius: 25),
            frame: (width: 350, height: 80),
            isSelected: tapped) {
                tapped.toggle()
            }
    }
}

struct ServerRowView_Previews: PreviewProvider {
    static var previews: some View {
        let connection = ServerConnection(url: "revelup.com/lucid-dream-machine", requestType: "POST", status: "404", time: "12:10")
        ServerRowView(serverConnection: connection)
            .previewLayout(.fixed(width: 370, height: 100))
    }
}
