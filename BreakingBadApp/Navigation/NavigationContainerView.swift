//
//  NavigationContainerView.swift
//  BreakingBadApp
//
//  Created by Андрей on 29.06.2022.
//

import SwiftUI

struct NavigationContainerView<Content: View>: View {
	
	@ObservedObject private var navigationViewModel: NavigationViewModel = .init()
	
	private let content: Content
	
	init(@ViewBuilder content: @escaping () -> Content) {
		self.content = content()
	}
	
	var body: some View {
		let isRoot = navigationViewModel.currentScreen == nil
		
		return ZStack {
			if isRoot {
				self.content
					.environmentObject(navigationViewModel)
					.transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
			} else {
				VStack {
					backButton
					navigationViewModel.currentScreen?.view
						.environmentObject(navigationViewModel)
						.transition(
							.asymmetric(
								insertion: navigationViewModel.navigationType == .forward ? .move(edge: .trailing) : .move(edge: .leading),
								removal: navigationViewModel.navigationType == .forward ? .move(edge: .leading) : .move(edge: .trailing)
							)
						)
				}
				.transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
			}
		}
	} // body
	
	private var backButton: some View {
		HStack {
			Button {
				withAnimation {
					navigationViewModel.pop()
				}
			} label: {
				Label("Back", systemImage: "chevron.backward")
			}
			Spacer()
		}
		.padding(.horizontal)
	}
	
}

struct NavigationContainerView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationContainerView {
			Text("text")
		}
	}
}
