//
//  NeumorphicToggleSwitch.swift
//  
//
//  Created by Tarik Yasar on 18.10.2022.
//

import Foundation
import SwiftUI

public struct NeumorphicToggleSwitch: View {
    var isOn: Binding<Bool>
    var isDarkMode: Bool
    
    public init(isOn: Binding<Bool>, isDarkMode: Bool) {
        self.isOn = isOn
        self.isDarkMode = isDarkMode
    }
    
    public var body: some View {
        ZStack {
            if (isDarkMode) {
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color.darkEnd)
                    .frame(width: 60, height: 40)
                    .shadow(color: Color.darkStart, radius: 10, x: -2, y: -2)
                    .shadow(color: Color.darkEnd, radius: 10, x: 2, y: 2)
            } else {
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color.offWhite)
                    .frame(width: 60, height: 40)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 4, y: 4)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -4, y: -4)
            }
            
            Toggle("", isOn: isOn)
                .frame(width: .zero, alignment: .center)
                .padding(.trailing, 10)
        }
    }
}
