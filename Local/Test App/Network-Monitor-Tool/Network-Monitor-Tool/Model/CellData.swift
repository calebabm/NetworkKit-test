//
//  CellData.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/4/21.
//

import Foundation

class CellData: Identifiable {
    var id = UUID()
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
