//
//  CharacterListView.swift
//  BreakingBadApp
//
//  Created by Андрей on 29.06.2022.
//

import SwiftUI

struct CharacterListView: View {
	
	@StateObject private var viewModel: CharactersViewModel = .init()
	@Binding var category: TVShow
	
	var body: some View {
		VStack {
			title
			list
				.onAppear {
					viewModel.fetchCharacters(by: category.rawValue)
				}
				.onChange(of: category) { newValue in
					viewModel.cleanList()
					viewModel.fetchCharacters(by: newValue.rawValue)
				}
		}
	} // body
	
	private var title: some View {
		HStack {
			Text("Characters")
				.font(.title)
				.bold()
			Spacer()
		}
		.padding(.horizontal)
	}
	
	private var loadingIndicator: some View {
		HStack{
			Spacer()
			ProgressView()
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
								viewModel.fetchCharacters(by: category.rawValue)
							}
						}
				}
			}
			if viewModel.canLoad {
				loadingIndicator
			}
		}
		.listStyle(.plain)
	}
	
}

struct CharacterListView_Previews: PreviewProvider {
	static var previews: some View {
		CharacterListView(category: .constant(TVShow.breakingBad))
	}
}
