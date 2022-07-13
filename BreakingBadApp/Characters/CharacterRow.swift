//
//  CharacterRow.swift
//  BreakingBadApp
//
//  Created by Андрей on 30.06.2022.
//

import SwiftUI
import TVShowsNetwork

struct CharacterRow: View {
	
	private let character: ModelCharacter
	
	init(_ character: ModelCharacter) {
		self.character = character
	}
	
    var body: some View {
		HStack {
			AsyncImage(url: URL(string: character.img)) { image in
				ZStack {
					Rectangle()
						.fill(.gray)
						.aspectRatio(2/3, contentMode: .fit)
					
					image
						.resizable()
						.aspectRatio(contentMode: .fill)
						.layoutPriority(-1)
				}
				.clipped()
				.cornerRadius(6)
			} placeholder: {
				ProgressView()
					.tint(.white)
			}
			.frame(width: 60)
			
			Text(character.name)
				.font(.title2)
			
			Spacer()
		}
		.frame(height: 70)
    }
}
