//
//  ContentView.swift
//  BreakingBadApp
//
//  Created by Андрей on 24.06.2022.
//

import SwiftUI

enum TVShow: String, CaseIterable {
	
	case breakingBad = "Breaking+Bad"
	case betterCallSaul = "Better+Call+Saul"
	
}

struct ContentView: View {
	
    var body: some View {
		NavigationContainerView {
			VStack {
				Spacer()
				title
				controls
				Spacer()
			}
		}
		.background(Color.black)
    }
	
	private var controls: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack(spacing: 20) {
				ForEach(TVShow.allCases, id: \.self) { show in
					NavigationScreen(destination: LazyView(CharacterListView(show.rawValue))) {
						Image(show.rawValue)
							.resizable()
							.aspectRatio(contentMode: .fit)
							.cornerRadius(15)
					}
				}
			}
			.padding(.horizontal)
			.frame(width: UIScreen.main.bounds.width)
		}
	}
	
	private var title: some View {
		HStack {
			Text("TV Shows")
				.font(.largeTitle)
				.bold()
				.foregroundColor(.white)
			Spacer()
		}
		.padding()
	}
	
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
