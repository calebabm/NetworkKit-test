//
//  MainViewCell.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/7/21.
//

import SwiftUI

struct MainViewCell<T: View>: View {
    
    var cellData: CellData
    var destination: T
    @State var tapped = false
    
    var body: some View {
        let view =
        Section {
            NavigationLink(isActive: $tapped) {
                destination
            } label: {
                Text(cellData.title)
                    .frame(alignment: .center)
            }
        }
        .frame(width: 350, height: 350, alignment: .center)
        
        createNeumorphic(
            element: view, shape: RoundedRectangle(cornerRadius: 25),
            frame: (width: 300, height: 270),
            isSelected: tapped) {
                tapped.toggle()
            }
    }
}

struct MainViewCell_Previews: PreviewProvider {
    static var previews: some View {
        let cellData = CellData(title: "Local")
        MainViewCell(cellData: cellData, destination: EmptyView())
            .previewLayout(.fixed(width: 300, height: 300))
        
    }
}
