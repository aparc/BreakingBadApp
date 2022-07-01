//
//  CharacterDescription.swift
//  BreakingBadApp
//
//  Created by Андрей on 30.06.2022.
//

import SwiftUI

struct CharacterDescription: View {
	
	private let description: [String: String]
	
	init(_ description: [String: String]) {
		self.description = description
	}
	
    var body: some View {
		VStack(spacing: 20) {
			ForEach(description.sorted(by: <), id: \.key) { (label, info) in
				HStack {
					Text("\(label):")
						.foregroundColor(.green)
					Text(info)
						.foregroundColor(.white)
					Spacer()
				}
			}
		}
    } // body
}
