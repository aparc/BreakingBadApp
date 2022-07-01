//
//  CharactersViewModel.swift
//  BreakingBadApp
//
//  Created by Андрей on 29.06.2022.
//

import Foundation
import SwiftUI
import TVShowsNetwork

final class CharactersViewModel: ObservableObject {
	
	@Published private(set) var charactersList: [ModelCharacter] = []
	@Published private(set) var canLoad: Bool = true
	private var page: Int = 0
	
	func fetchCharacters(by category: String) {
		CharactersByCatergoryAPI.charactersGetByCategory(
			category: category,
			limit: APIHelper.pageSize,
			offset: page) { data, _ in
				guard let batch = data else { return }
				
				self.charactersList.append(contentsOf: batch)
				self.page += 10
				self.canLoad = batch.count == APIHelper.pageSize
			}
	}
	
}
