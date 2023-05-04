//
//  Styles.swift
//  
//
//  Created by Tarik Yasar on 18.10.2022.
//

import Foundation
import SwiftUI

struct LightButtonStyle<S: Shape>: ButtonStyle {
    var shape: S
    var width: CGFloat = 50
    var height: CGFloat = 50
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: width, height: height)
            .padding(30)
            .background(
                Group {
                    if configuration.isPressed {
                        shape
                            .fill(Color.offWhite)
                            .overlay(
                                shape
                                    .stroke(Color.gray, lineWidth: 4)
                                    .blur(radius: 4)
                                    .offset(x: 2, y: 2)
                                    .mask(shape.fill(LinearGradient(Color.black, Color.clear)))
                            )
                            .overlay(
                                shape
                                    .stroke(Color.white, lineWidth: 8)
                                    .blur(radius: 4)
                                    .offset(x: -2, y: -2)
                                    .mask(shape.fill(LinearGradient(Color.clear, Color.black)))
                            )
                    } else {
                        shape
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
                }
            )
    }
}

struct DarkButtonStyle<S: Shape>: ButtonStyle {
    var shape: S
    var width: CGFloat = 50
    var height: CGFloat = 50
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: width, height: height)
            .padding(30)
            .contentShape(shape)
            .background(
                DarkBackground(isHighlighted: configuration.isPressed, shape: shape)
            )
    }
}

struct DarkBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S

    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(Color.darkEnd)
                    .shadow(color: Color.darkStart, radius: 10, x: 5, y: 5)
                    .shadow(color: Color.darkEnd, radius: 10, x: -5, y: -5)

            } else {
                shape
                    .fill(Color.darkEnd)
                    .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
            }
        }
    }
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
