//
//  NeumorphicPressedSurface.swift
//  
//
//  Created by Tarik Yasar on 20.10.2022.
//

import SwiftUI

public struct NeumorphicPressedSurface<SurfaceShape>: View where SurfaceShape: Shape {
    var surfaceShape: SurfaceShape
    var isDarkModeEnabled: Bool
    var lightModeColor: Color
    var darkModeColor: Color
    var width: CGFloat
    var height: CGFloat
    
    public init(
        surfaceShape: SurfaceShape,
        isDarkModeEnabled: Bool,
        lightModeColor: Color = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255),
        darkModeColor: Color = Color(red: 45 / 255, green: 45 / 255, blue: 50 / 255),
        width: CGFloat = 250,
        height: CGFloat = 250
    ) {
        self.surfaceShape = surfaceShape
        self.isDarkModeEnabled = isDarkModeEnabled
        self.lightModeColor = lightModeColor
        self.darkModeColor = darkModeColor
        self.width = width
        self.height = height
    }
    
    public var body: some View {
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
    }
}
