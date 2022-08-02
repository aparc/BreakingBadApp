//
//  CharacterScreen.swift
//  BreakingBadApp
//
//  Created by Андрей on 30.06.2022.
//

import SwiftUI
import TVShowsNetwork
import NavigationStack

struct CharacterScreen: View {
	
	let character: ModelCharacter
	
	var body: some View {
		ScrollView {
			ZStack {
				AsyncImage(url: URL(string: character.img)) { image in
					image
						.resizable()
						.aspectRatio(contentMode: .fit)
						.overlay(
							LinearGradient(
								colors: [.black, .clear, .clear],
								startPoint: .bottom,
								endPoint: .top
							)
						)
				} placeholder: {
					Rectangle()
						.fill(.black)
						.aspectRatio(contentMode: .fit)
				}
				.layoutPriority(1)
				VStack {
					HStack {
						Spacer()
						NavigationScreen(destination: LazyView(QuotesScreen(author: character.name))) {
							
							Text("Quotes")
								.foregroundColor(.white)
								.padding(10)
								.background(
									RoundedRectangle(cornerRadius: 8)
										.fill(.green)
								)
						}
						
					}
					Spacer()
					HStack {
						Text(character.name)
							.font(.largeTitle)
							.bold()
							.foregroundColor(.white)
						Spacer()
					}
				}
				.padding()
			}
			CharacterDescription(
				[
					"Birthday": character.birthday,
					"Nickname": character.nickname,
					"Played by": character.portrayed
				]
			)
			.padding()
		}
		.background(Color.black)
	} // body
}

struct CharacterScreen_Previews: PreviewProvider {
	
	static let character = ModelCharacter(
		charId: 1,
		name: "Walter White",
		birthday: "09-07-1958",
		occupation: ["High School Chemistry Teacher", "Meth King Pin"],
		img: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg",
		status: "Deceased",
		nickname: "Heisenberg",
		appearance: [1, 2, 3, 4, 5],
		portrayed: "Bryan Cranston",
		category: "",
		betterCallSaulAppearance: [])
	
	static var previews: some View {
		CharacterScreen(character: character)
	}
}
