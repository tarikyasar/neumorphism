//
//  NeumorphicSurface.swift
//  
//
//  Created by Tarik Yasar on 18.10.2022.
//

import SwiftUI

public struct NeumorphicSurface<SurfaceShape>: View where SurfaceShape: Shape {
    var surfaceShape: SurfaceShape
    var isDarkModeEnabled: Bool
    var lightModeColor: Color
    var darkModeColor: Color
    var width: CGFloat
    var height: CGFloat
    var isPressed: Bool
    
    public init(
        surfaceShape: SurfaceShape,
        isDarkModeEnabled: Bool,
        lightModeColor: Color = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255),
        darkModeColor: Color = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255),
        width: CGFloat = 250,
        height: CGFloat = 250,
        isPressed: Bool = false
    ) {
        self.surfaceShape = surfaceShape
        self.isDarkModeEnabled = isDarkModeEnabled
        self.lightModeColor = lightModeColor
        self.darkModeColor = darkModeColor
        self.width = width
        self.height = height
        self.isPressed = isPressed
    }
    
    public var body: some View {
        if (isPressed) {
            if (isDarkModeEnabled) {
                surfaceShape
                    .fill(darkModeColor)
                    .frame(width: width, height: height)
                    .overlay(
                        surfaceShape
                            .stroke(Color.black, lineWidth: 4)
                            .blur(radius: 4)
                            .offset(x: 2, y: 2)
                            .mask(surfaceShape.fill(LinearGradient(Color.blue, Color.clear)))
                    )
                    .overlay(
                        surfaceShape
                            .stroke(Color.gray, lineWidth: 8)
                            .blur(radius: 4)
                            .offset(x: -2, y: -2)
                            .mask(surfaceShape.fill(LinearGradient(Color.clear, Color.black)))
                    )
            } else {
                surfaceShape
                    .fill(lightModeColor)
                    .frame(width: width, height: height)
                    .overlay(
                        surfaceShape
                            .stroke(Color.gray, lineWidth: 4)
                            .blur(radius: 4)
                            .offset(x: 2, y: 2)
                            .mask(surfaceShape.fill(LinearGradient(Color.black, Color.clear)))
                    )
                    .overlay(
                        surfaceShape
                            .stroke(Color.white, lineWidth: 8)
                            .blur(radius: 4)
                            .offset(x: -2, y: -2)
                            .mask(surfaceShape.fill(LinearGradient(Color.clear, Color.black)))
                    )
            }
        } else {
            if (isDarkModeEnabled) {
                surfaceShape
                    .fill(darkModeColor)
                    .frame(width: width, height: height)
                    .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
            } else {
                surfaceShape
                    .fill(lightModeColor)
                    .frame(width: width, height: height)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            }
        }
    }
}
