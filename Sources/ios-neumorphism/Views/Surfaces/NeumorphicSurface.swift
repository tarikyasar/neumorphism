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
    var lightModeColor: Color = Color.offWhite
    var darkModeColor: Color = Color.darkEnd
    
    public var body: some View {
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
