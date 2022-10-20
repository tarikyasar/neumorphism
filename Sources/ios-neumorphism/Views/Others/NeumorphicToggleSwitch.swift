//
//  NeumorphicToggleSwitch.swift
//  
//
//  Created by Tarik Yasar on 18.10.2022.
//

import Foundation
import SwiftUI

public struct NeumorphicToggleSwitch: View {
    @State var isOn: Bool
    var isDarkMode: Bool
    var width: CGFloat
    var height: CGFloat
    var activatedColor: Color
    
    public init(
        isOn: State<Bool>,
        isDarkMode: Bool,
        width: CGFloat = 100,
        height: CGFloat = 40,
        activatedColor: Color
    ) {
        self._isOn = isOn
        self.isDarkMode = isDarkMode
        self.width = width
        self.height = height
        self.activatedColor = activatedColor
    }
    
    public var body: some View {
        ZStack {
            if (self.isOn) {
                RoundedRectangle(cornerRadius: 60)
                    .fill(activatedColor)
                    .frame(width: width, height: height)
            } else {
                NeumorphicPressedSurface(
                    surfaceShape: RoundedRectangle(cornerRadius: 60),
                    isDarkModeEnabled: isDarkMode,
                    width: width,
                    height: height
                )
            }
            
            HStack {
                Circle()
                    .fill(isDarkMode == true ? Color.darkStart : Color.offWhite)
                    .shadow(radius: 4)
                    .frame(height: height - 10)
                    .padding(.horizontal, 5)
                    .frame(width: width, height: height, alignment: self.isOn == true ? .trailing : .leading)
            }
            .frame(width: width, height: height)
        }
        .onTapGesture {
            withAnimation(.easeInOut) {
                isOn.toggle()
            }
        }
    }
}
