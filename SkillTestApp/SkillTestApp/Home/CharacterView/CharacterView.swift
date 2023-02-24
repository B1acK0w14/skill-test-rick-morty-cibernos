//
//  CharacterView.swift
//  SkillTestApp
//
//  Created by David Penagos on 24/02/23.
//

import SwiftUI

struct CharacterView: View {
    
    // MARK: - Properties
    var viewModel = HomeViewModel()
    var typeOfResult: [Results]
    var requestedFromSearch: Bool = false
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(typeOfResult) { character in
                        CharacterCell(characterResult: character)
                    }
                }
                .background(Color(Asset.grayTableHome.color))
            }
            .padding([.top], 1)
            .padding([.bottom], 18)
            
            HStack {
                /// Previous Button
                Button {
                    viewModel.followingPages(typeButton: .previous,
                                             requestedForSearch: requestedFromSearch)
                } label: {
                    Text(L10n.HomeView.previusPageButton)
                }
                .disabled(viewModel.prevButtonDisable)
                .buttonStyle(.bordered)
                .padding([.leading], 20)
                
                Spacer()
                
                /// Next Button
                Button {
                    viewModel.followingPages(typeButton: .next,
                                             requestedForSearch: requestedFromSearch)
                } label: {
                    Text(L10n.HomeView.nextPageButton)
                }
                .disabled(viewModel.nextButtonDisable)
                .padding([.trailing], 20)
                .buttonStyle(.bordered)
            }
            .frame(alignment: .center)
            .padding([.bottom], 24)
        }
    }
}
