//
//  NavigationViewModel.swift
//  BreakingBadApp
//
//  Created by Андрей on 29.06.2022.
//

import Foundation
import SwiftUI

final class NavigationViewModel: ObservableObject {
	
	@Published private(set) var currentScreen: Screen?
	var navigationType: NavigationType = .forward
	private var navigationStack = NavigationStack() {
		didSet {
			currentScreen = navigationStack.top()
		}
	}
	
	func push(_ view: AnyView) {
		navigationType = .forward
		navigationStack.push(view)
	}
	
	func pop() {
		navigationType = .back
		navigationStack.pop()
	}
	
	func popToRoot() {
		navigationType = .back
		navigationStack.popToRoot()
	}
	
}
