//
//  UI+Neumorphic.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/8/21.
//

import SwiftUI

//TODO: Create a custom model to create Neumorphic elements
func createNeumorphic<T: View, S: Shape>(element: T, shape: S, frame: (width: CGFloat, height: CGFloat), isSelected: Bool, onTap: @escaping () -> Void) -> some View {
    return ZStack {
        if isSelected {
            shape
                .fill(Color.offWhite)
                .overlay(
                    shape
                        .stroke(Color.gray, lineWidth: 4)
                        .blur(radius: 4)
                        .offset(x: 2, y: 2)
                        .mask(shape
                                .fill(LinearGradient(Color.black, Color.clear)))
                )
                .overlay(
                    shape
                        .stroke(Color.white, lineWidth: 8)
                        .blur(radius: 4)
                        .offset(x: -2, y: -2)
                        .mask(shape
                                .fill(LinearGradient(Color.clear, Color.black)))
                )
                .frame(width: frame.width, height: frame.height)
                .onTapGesture {
                    onTap()
                }
        } else {
            shape
                .fill(Color.offWhite)
                .frame(width: frame.width, height: frame.height)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                .onTapGesture {
                    onTap()
                }
        }
        element
    }
    .edgesIgnoringSafeArea(.all)
}
