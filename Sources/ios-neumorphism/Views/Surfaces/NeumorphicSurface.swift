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
    
    public init(
        surfaceShape: SurfaceShape,
        isDarkModeEnabled: Bool,
        lightModeColor: Color = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255),
        darkModeColor: Color = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255),
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
