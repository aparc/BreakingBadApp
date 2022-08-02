//
//  Root.swift
//  BreakingBadApp
//
//  Created by Андрей on 11.07.2022.
//

import SwiftUI
import NavigationStack

enum TVShow: String, CaseIterable {
	
	case breakingBad = "Breaking+Bad"
	case betterCallSaul = "Better+Call+Saul"
	
}

struct Root: View {
	
	@State private var duplicate: TVShow? = nil
	@State private var size: CGSize = CGSize(width: 0, height: 0)
	@State private var position: CGPoint = .zero
	@State private var offset: CGSize = .zero
	@State private var scale:CGFloat = 1
	
	@State private var category: TVShow = TVShow.breakingBad
	
	var body: some View {
		NavigationContainerView {
			ZStack {
				if let duplicate = duplicate {
					Image(duplicate.rawValue)
						.resizable()
						.frame(width: size.width, height: size.height)
						.cornerRadius(20)
						.position(position)
						.scaleEffect(scale)
						.offset(offset)
						.edgesIgnoringSafeArea(.top)
						.zIndex(1)
				}
				
				VStack {
					title
					segmentedControl
					CharacterListView(category: $category)
				}
			}
		}
	} // body
	
	var title: some View {
		HStack {
			Text("TV Shows")
				.font(.largeTitle)
				.bold()
			Spacer()
		}
		.padding()
	}
	
	var segmentedControl: some View {
		ScrollView(.horizontal) {
			HStack(spacing: 20) {
				ForEach(TVShow.allCases, id: \.self) { show in
					GeometryReader { geo in
						Button {
							onButtonTapped(geo: geo, show: show)
						} label: {
							Image(show.rawValue)
								.resizable()
								.cornerRadius(20)
								.opacity(duplicate == show ? 0 : 1) // hide image in scroll view after tap
						}
					}
				}
			}
			.padding(.horizontal)
			.frame(width: UIScreen.main.bounds.width, height: 250)
		}
	}
	
	private func onButtonTapped(geo: GeometryProxy, show: TVShow) {
		if category == show { return }
		
		category = show
		
		// size definitions of duplicated image
		size = geo.frame(in: .global).size
		position = CGPoint(x: geo.frame(in: .global).midX, y: geo.frame(in: .global).midY)
		
		// show duplicated image in ZStack
		duplicate = show
		
		// zoom out and move duplicated image to the right bottom corner
		withAnimation(.easeInOut(duration: 1)) {
			offset = CGSize(
				width: UIScreen.main.bounds.maxX,
				height: UIScreen.main.bounds.maxY
			)
			scale = 0
		}
		
		// moving image outside viewport
		DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			offset = CGSize(
				width: -500,
				height: -500
			)
			// getting back image from left top corner to initial position
			withAnimation(.easeInOut(duration: 0.5)) {
				offset = .zero
				scale = 1
			}
		}
		
		// removing duplicated image from content
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			duplicate = nil
		}
	}
}

struct Root_Previews: PreviewProvider {
	static var previews: some View {
		Root()
	}
}
