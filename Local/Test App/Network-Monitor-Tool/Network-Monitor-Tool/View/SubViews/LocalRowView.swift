//
//  LocalRowView.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/7/21.
//

import SwiftUI

struct LocalRowView: View {
    
    var localConnection: LocalConnection
    @State var tapped = false
    
    var body: some View {
        let view =
        Section {
            NavigationLink(isActive: $tapped) {
                EmptyView()
            } label: {
                HStack {
                    Text(localConnection.state)
                        .font(.system(size: 12))
                    
                    Text(localConnection.host)
                        .font(.system(size: 12))
                    VStack {
                        ForEach(localConnection.clients, id: \.self) { client in
                            Text(client)
                                .font(.system(size: 12))
                        }
                    }
                    Text(localConnection.time)
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

struct LocalRowView_Previews: PreviewProvider {
    static var previews: some View {
        let connection = LocalConnection(time: "12:14", state: "Offline", host: "172.20.10.3", client: ["172.20.10.10", "172.20.10.11", "172.20.10.12"])
        LocalRowView(localConnection: connection)
            .previewLayout(.fixed(width: 370, height: 100))
    }
}
