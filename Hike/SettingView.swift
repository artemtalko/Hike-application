//
//  SettingView.swift
//  Hike
//
//  Created by Artem Talko on 17.07.2023.
//

import SwiftUI

struct SettingView: View {
	//MARK: - PROPERTIES
	
	private let alternativeIcons: [String] = [
		"AppIcon-MagnifyingGlass",
		"AppIcon-Map",
		"AppIcon-Mushroom",
		"AppIcon-Camera",
		"AppIcon-Backpack",
		"AppIcon-Campfire",
	]
	
	
	
    var body: some View {
			List {
				//MARK: - SECTION: HEADER
				
				Section{
					
					HStack{
						Spacer()
						Image(systemName: "laurel.leading")
							.font(.system(size: 80, weight: .black))
						VStack(spacing: -10) {
							Text("Hike")
								.font(.system(size: 66, weight: .black))
							Text("Editor`s Chose")
								.fontWeight(.medium)
						}
						Image(systemName: "laurel.trailing")
							.font(.system(size: 80, weight: .black))
						Spacer()
					}
					.foregroundStyle(
						LinearGradient(colors:
														[
															.customGrayLight,
															.customGreenMedium,
															.customGreenDark
														],
													 startPoint: .top,
													 endPoint: .bottom)
					)
					.padding(.top, 8)
					
					VStack(spacing: 8){
						Text("Where can you find\nperfect tracks?")
							.font(.title2)
							.fontWeight(.heavy)
						
						Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
							.font(.footnote)
							.italic()
						
						Text("Dust off the boots! It`s time for a walk.")
							.fontWeight(.heavy)
							.foregroundColor(.customGreenMedium)
					}
					.multilineTextAlignment(.center)
					.padding(.bottom, 16)
					.frame(maxWidth: .infinity)
				}//: HEADER
				.listRowSeparator(.hidden)
				
				//MARK: - SECTION: ICONS
				
				Section(header: Text("alternative icons")) {
					ScrollView(.horizontal, showsIndicators: false) {
						HStack(spacing: 12) {
							ForEach(alternativeIcons.indices, id: \.self) { item in
								Button {
									print("Icon was pressed")
									UIApplication.shared.setAlternateIconName(alternativeIcons[item]) { error in
										if error != nil {
											print("dailed request to update app`s icon: \(String(describing: error?.localizedDescription))")
										} else {
											print("success!")
										}
									
									}
								} label: {
									Image("\(alternativeIcons[item])-Preview")
										.resizable()
										.scaledToFit()
										.frame(width: 80, height: 80)
										.cornerRadius(16)
								}
							.buttonStyle(.borderless)
							}
						}
					}//: SCROLL VIEW END
					.padding(.top, 12)
					
					Text("Choose your favorite icon from the collection above.")
						.frame(minWidth: 0, maxWidth: .infinity)
						.multilineTextAlignment(.center)
						.foregroundColor(.secondary)
						.font(.footnote)
						.padding(.bottom, 12)
				}
				.listRowSeparator(.hidden)
				
				//MARK: - SECTION: ABOUT
				Section(
					header: Text("about the app"),
					footer: HStack{
						Spacer()
						Text("Copyrights © All rights deserved.")
						Spacer()
					}
						.padding(.vertical, 8)
				) {
					
					CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
					
					CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowTintColor: .red)
					
					CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
					
					CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
					
					CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Artem Talko", rowTintColor: .mint)
					
					CustomListRowView(rowLabel: "Contact", rowIcon: "person", rowTintColor: .indigo, rowLinkLabel: "telegram", rowLinkDestination: "https://t.me/qer21")
					CustomListRowView(rowLabel: "Projects", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "github", rowLinkDestination: "https://github.com/artemtalko")
					
				
					
				}//: SECTION
				
			} //: LIST
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}