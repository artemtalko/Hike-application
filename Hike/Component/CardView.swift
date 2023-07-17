//
//  CardView.swift
//  Hike
//
//  Created by Artem Talko on 16.07.2023.
//

import SwiftUI

struct CardView: View {
		
		//MARK: - PROPERTIES
		@State private var imageNumber: Int = 1
		@State private var randomNumber: Int = 1
	@State private var isShowingSpeed: Bool = false
		
		//MARK: - FUNCTIONS
		func randomImage() {
				repeat {
						randomNumber = Int.random(in: 1...5)
						
				} while(randomNumber == imageNumber)
			
				imageNumber = randomNumber
		}
		
		
		
		var body: some View {
				
				ZStack {
						CustomBackgroundView()
						
						VStack {
								
								//MARK: - HEADER
										
								VStack(alignment: .leading) {
										HStack{
												Text("Hiking")
														.fontWeight(.black)
														.font(.system(size: 52))
														.foregroundStyle(
																LinearGradient(
																		colors: [.customGrayLight, .customGrayMedium],
																		startPoint: .top,
																		endPoint: .bottom
																)
												)
												
												Spacer()
												
												Button {
														//ACTION: Show a sheet
														print("The button was pressed.")
													isShowingSpeed.toggle()
												} label: {
														CustomButtonView()
												}
												.sheet(isPresented: $isShowingSpeed) {
													SettingView()
														.presentationDragIndicator(.visible)
														.presentationDetents([.medium, .large])
												}
										}
										Text("Fun and enjoyable outdoor activity for friends and family")
												.multilineTextAlignment(.leading)
												.italic()
												.foregroundColor(.customGrayMedium)
								} //: HEADER
								.padding(.horizontal, 30)
								
								//MARK: - MAIN CONTENT
								
								ZStack {
										CustomCircleView()
										
										Image("image-\(imageNumber)")
													.resizable()
													.scaledToFit()
													.animation( .easeOut(duration: 0.75), value: imageNumber)
								}
								
								//MARK: - FOOTER
								
								Button {
										randomImage()
								} label: {
										Text("Explore More")
												.font(.title2)
												.fontWeight(.heavy)
												.foregroundStyle(
														LinearGradient(colors: [
																.customGreenLight,
																.customGreenMedium
														],
														startPoint: .top,
														endPoint: .bottom)
												)
												.shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
								}
								.buttonStyle(GradientButton())
								
						}//: ZSTACK
				}//: CARD
				.frame(width: 320, height: 570)
		}
}

struct CardView_Previews: PreviewProvider {
		static var previews: some View {
				CardView()
		}
}

