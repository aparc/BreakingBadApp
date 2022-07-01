//
//  NavigationScreen.swift
//  BreakingBadApp
//
//  Created by Андрей on 29.06.2022.
//

import SwiftUI

struct NavigationScreen<Destination: View, Label: View>: View {
	
	@EnvironmentObject private var navigationViewModel: NavigationViewModel
	
	private let destination: () -> Destination
	private let label: () -> Label
	
	init(
		destination: @autoclosure @escaping () -> Destination,
		@ViewBuilder _ label: @escaping () -> Label
	) {
		self.destination = destination
		self.label = label
	}
	
	var body: some View {
		label()
			.contentShape(Rectangle())
			.onTapGesture {
				withAnimation {
					navigationViewModel.push(destination().toAnyView())
				}
			}
	}
}

struct NavigationScreen_Previews: PreviewProvider {
	static var previews: some View {
		NavigationScreen(destination: LazyView(Text("Destination"))) {
			Text("🍉")
		}
	}
}

extension View {
	func toAnyView() -> AnyView {
		AnyView(self)
	}
}
