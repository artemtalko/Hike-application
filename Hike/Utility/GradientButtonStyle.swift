//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Artem Talko on 17.07.2023.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding()
            .background(
                configuration.isPressed ?
                LinearGradient(colors: [.customGrayMedium, .customGrayLight ], startPoint: .top, endPoint: .bottom) :
                LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(40)
    }
}
