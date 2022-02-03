//
//  Extensions.swift
//  
//
//  Created by Caleb Meurer on 1/13/22.
//

import Foundation

extension Result where Success == Void {
    public static var success: Result {
        .success(())
    }
}
