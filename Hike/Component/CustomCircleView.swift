//
//  CustomCircleView.swift
//  Hike
//
//  Created by Artem Talko on 17.07.2023.
//

import SwiftUI

struct CustomCircleView: View {
		@State private var isAnimatedGradient: Bool = false

		var body: some View {
			ZStack {
				Circle()
							.fill(
									LinearGradient(
											colors: [
													.customIndigoLight,
													.customSalmonLight
															],
											startPoint: isAnimatedGradient  ? .topLeading : .bottomLeading,
											endPoint: isAnimatedGradient  ? .bottomTrailing : .topTrailing)
							)
							.onAppear {
									withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true))  {
											isAnimatedGradient.toggle()
									}
								
							}
				MotionAnimationView()
			}		.frame(width: 256, height: 256)
		}
}

struct CustomCircleView_Previews: PreviewProvider {
		static var previews: some View {
				CustomCircleView()
		}
}

