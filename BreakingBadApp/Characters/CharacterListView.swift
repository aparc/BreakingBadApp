//
//  CharacterListView.swift
//  BreakingBadApp
//
//  Created by Андрей on 29.06.2022.
//

import SwiftUI

struct CharacterListView: View {
	
	@ObservedObject private var viewModel: CharactersViewModel = .init()
	private let category: String
	
	init(_ category: String) {
		self.category = category
	}
	
	var body: some View {
		VStack {
			title
			list
				.onAppear {
					viewModel.fetchCharacters(by: category)
				}
		}
	} // body
	
	private var title: some View {
		HStack {
			Text("Characters")
				.font(.largeTitle)
				.foregroundColor(.white)
				.bold()
			Spacer()
		}
		.padding()
	}
	
	private var loadingIndicator: some View {
		HStack{
			Spacer()
			ProgressView()
				.tint(.white)
			Spacer()
		}
	}
	
	private var list: some View {
		List {
			ForEach(viewModel.charactersList) { character in
				NavigationScreen(destination: LazyView(CharacterScreen(character: character))) {
					CharacterRow(character)
						.onAppear {
							if viewModel.charactersList.last == character {
								viewModel.fetchCharacters(by: category)
							}
						}
				}
				.listRowBackground(Color.black)
				.listRowSeparatorTint(.gray)
			}
			if viewModel.canLoad {
				loadingIndicator
					.listRowBackground(Color.black)
			}
		}
		.listStyle(.plain)
	}
	
}

struct CharacterListView_Previews: PreviewProvider {
	static var previews: some View {
		CharacterListView("Breaking Bad")
	}
}
