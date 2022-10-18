//
//  NeumorphicViews.swift
//  
//
//  Created by Tarik Yasar on 18.10.2022.
//

import Foundation
import SwiftUI

struct CircularNeumorphicButton<Label>: View where Label: View {
    var action: () -> Void
    var label: Label
    var isDarkModeEnabled: Bool
    
    var body: some View {
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

struct RoundedNeumorphicButton<Label>: View where Label: View {
    var action: () -> Void
    var label: Label
    var isDarkModeEnabled: Bool
    
    var body: some View {
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


struct NeumorphicShape<SurfaceShape>: View where SurfaceShape: Shape {
    var surfaceShape: SurfaceShape
    var isDarkModeEnabled: Bool
    var lightModeColor: Color = Color.offWhite
    var darkModeColor: Color = Color.darkEnd
    
    var body: some View {
        if (isDarkModeEnabled) {
            surfaceShape
                .fill(darkModeColor)
                .frame(width: 250, height: 250)
                .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
        } else {
            surfaceShape
                .fill(lightModeColor)
                .frame(width: 250, height: 250)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
        }
        
    }
}

struct NeumorphicShape_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.darkEnd
            
            NeumorphicShape(
                surfaceShape: RoundedRectangle(cornerRadius: 10),
                isDarkModeEnabled: true
            )
            
        }.ignoresSafeArea()
    }
}
