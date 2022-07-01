//
//  NavigationStack.swift
//  BreakingBadApp
//
//  Created by Андрей on 29.06.2022.
//

import Foundation
import SwiftUI

struct NavigationStack {
	
	private var stack: [Screen] = []
	
	mutating func push(_ view: AnyView) {
		stack.append(Screen(view: view))
	}
	
	mutating func pop() {
		let _ = stack.popLast()
	}
	
	mutating func popToRoot() {
		stack.removeAll()
	}
	
	func top() -> Screen? {
		stack.last
	}
	
}
