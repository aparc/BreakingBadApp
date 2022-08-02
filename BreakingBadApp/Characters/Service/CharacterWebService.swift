//
//  CharacterService.swift
//  BreakingBadApp
//
//  Created by Андрей on 02.08.2022.
//

import Foundation
import TVShowsNetwork

final class CharacterWebService {
	
	func getCharacters(_ category: String, _ page: Int) async -> [ModelCharacter] {
		await withCheckedContinuation { continuation in
			CharactersByCatergoryAPI.charactersGetByCategory(
				category: category,
				limit: APIHelper.pageSize,
				offset: page) { data, _ in
					continuation.resume(returning: data ?? [])
				}
		}
	}
	
}
