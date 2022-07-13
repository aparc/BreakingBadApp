//
//  QuotesViewModel.swift
//  BreakingBadApp
//
//  Created by Андрей on 13.07.2022.
//

import Foundation
import TVShowsNetwork

final class QuotesViewModel: ObservableObject {
	
	@Published private(set) var quotesList: [Quote] = []
	
	func fetchQuotes(by author: String) {
		QuotesAPI.quotesByAuthor(author: author) { data, _ in
			guard let quotes = data else { return }
			
			self.quotesList.append(contentsOf: quotes)
		}
	}
	
}
