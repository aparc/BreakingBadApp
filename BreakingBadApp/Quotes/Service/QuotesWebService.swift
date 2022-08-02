//
//  QuotesService.swift
//  BreakingBadApp
//
//  Created by Андрей on 02.08.2022.
//

import Foundation
import TVShowsNetwork

final class QuotesWebService {
	
	func getQuotes(by author: String) async -> [Quote] {
		await withCheckedContinuation { continuation in
			QuotesAPI.quotesByAuthor(author: author) { data, _ in
				continuation.resume(returning: data ?? [])
			}
		}
	}
	
}
