//
//  RoundedNeumorphicButton.swift
//  
//
//  Created by Tarik Yasar on 18.10.2022.
//

import SwiftUI

public struct RoundedNeumorphicButton<Label>: View where Label: View {
    var action: () -> Void
    var label: Label
    var isDarkModeEnabled: Bool
    var width: CGFloat = 50
    var height: CGFloat = 50
    
    public init(
        action: @escaping () -> Void,
        label: Label,
        isDarkModeEnabled: Bool,
        width: CGFloat = 50,
        height: CGFloat = 50
    ) {
        self.action = action
        self.label = label
        self.isDarkModeEnabled = isDarkModeEnabled
        self.width = width
        self.height = height
    }
    
    public var body: some View {
        if (isDarkModeEnabled) {
            Button(action: {
                action()
            }) {
                label
            }
            .buttonStyle(DarkButtonStyle(shape: RoundedRectangle(cornerRadius: 30), width: width, height: height))
        } else {
            Button(action: {
                action()
            }) {
                label
            }
            .buttonStyle(LightButtonStyle(shape: RoundedRectangle(cornerRadius: 30), width: width, height: height))
        }
    }
}
