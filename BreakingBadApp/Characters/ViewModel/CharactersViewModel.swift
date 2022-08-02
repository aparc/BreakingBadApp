//
//  CharactersViewModel.swift
//  BreakingBadApp
//
//  Created by Андрей on 29.06.2022.
//

import Foundation
import SwiftUI
import TVShowsNetwork
import ServiceLocator

@MainActor final class CharactersViewModel: ObservableObject {
	
	@Published private(set) var charactersList: [ModelCharacter] = []
	@Published private(set) var canLoad: Bool = true
	@Injected private var characterService: CharacterWebService?
	private var page: Int = 0
	
	func fetchCharacters(by category: String) {
		Task { 
			guard let characters = await characterService?.getCharacters(category, page) else { return }
			
			charactersList.append(contentsOf: characters)
			page += 10
			canLoad = characters.count == APIHelper.pageSize
		}
	}
	
	func cleanList() {
		charactersList.removeAll()
		page = 0
		canLoad = true
	}
	
}
