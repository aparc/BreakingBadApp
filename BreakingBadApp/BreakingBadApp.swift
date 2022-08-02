//
//  BreakingBadAppApp.swift
//  BreakingBadApp
//
//  Created by Андрей on 24.06.2022.
//

import SwiftUI
import ServiceLocator

@main
struct BreakingBadApp: App {
	
	init() {
		Configurator.shared.registerService(CharacterWebService())
		Configurator.shared.registerService(QuotesWebService())
	}
	
    var body: some Scene {
        WindowGroup {
			Root()
        }
    }
}
