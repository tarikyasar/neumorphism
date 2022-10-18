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
    
    public var body: some View {
        if (isDarkModeEnabled) {
            Button(action: {
                action()
            }) {
                label
            }
            .buttonStyle(DarkButtonStyle(shape: RoundedRectangle(cornerRadius: 30)))
        } else {
            Button(action: {
                action()
            }) {
                label
            }
            .buttonStyle(LightButtonStyle(shape: RoundedRectangle(cornerRadius: 30)))
        }
    }
}
