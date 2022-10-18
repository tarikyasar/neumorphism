//
//  CircularNeumorphicButton.swift
//  
//
//  Created by Tarik Yasar on 18.10.2022.
//

import SwiftUI

public struct CircularNeumorphicButton<Label>: View where Label: View {
    public var action: () -> Void
    public var label: Label
    public var isDarkModeEnabled: Bool
    
    public init(_ action: @escaping () -> Void, _ label: Label, _ isDarkModeEnabled: Bool) {
        self.action = action
        self.label = label
        self.isDarkModeEnabled = isDarkModeEnabled
    }
    
    public var body: some View {
        if (isDarkModeEnabled) {
            Button(action: {
                action()
            }) {
                label
            }
            .buttonStyle(DarkButtonStyle(shape: Circle()))
        } else {
            Button(action: {
                action()
            }) {
                label
            }
            .buttonStyle(LightButtonStyle(shape: Circle()))
        }
    }
}
