//
//  QuotesScreen.swift
//  BreakingBadApp
//
//  Created by Андрей on 13.07.2022.
//

import SwiftUI

struct QuotesScreen: View {
	
	@ObservedObject private var viewModel: QuotesViewModel = .init()
	
	let author: String
	
    var body: some View {
		VStack(alignment: .leading) {
			Text("Quotes")
				.font(.largeTitle)
				.bold()
				.padding()
			List {
				if viewModel.quotesList.isEmpty {
					HStack {
						Spacer()
						ProgressView()
						Spacer()
					}
				}
				ForEach(viewModel.quotesList) { quote in
					Text(quote.quote)
				}
			}
			.listStyle(.plain)
		}
		.onAppear {
			viewModel.fetchQuotes(by: author)
		}
    }
}

struct QuotesScreen_Previews: PreviewProvider {
    static var previews: some View {
        QuotesScreen(author: "Walter White")
    }
}
