//
//  QuotesViewModel.swift
//  BreakingBadApp
//
//  Created by Андрей on 13.07.2022.
//

import Foundation
import TVShowsNetwork
import ServiceLocator

@MainActor final class QuotesViewModel: ObservableObject {
	
	@Published private(set) var quotesList: [Quote] = []
	@Injected private var quotesService: QuotesWebService?
	
	func fetchQuotes(by author: String) {
		Task { 
			guard let quotes = await quotesService?.getQuotes(by: author) else { return }
			quotesList.append(contentsOf: quotes)
		}
	}
	
}
