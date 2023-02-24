//
//  HomeView.swift
//  SkillTestApp
//
//  Created by David Penagos on 22/02/23.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    @ObservedObject var viewModel = HomeViewModel()
    
    @State private var searchText = String.emptyString
    
    var body: some View {
        ZStack {
            TabView {
                switch viewModel.state {
                case .idle:
                    /// Render a clear color and start the loading process when the view first appears, which should make the view model transition into its loading state:
                    Color.clear.onAppear(perform: viewModel.load)
                case .loading:
                    ProgressView()
                case .failed(let error):
                    Text("\(error)")
                case .loaded:
                    VStack {
                        ScrollView {
                            LazyVStack(spacing: 20) {
                                ForEach(viewModel.charactersResult) { character in
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
                                viewModel.followingPages(typeButton: .previous)
                            } label: {
                                Text(L10n.HomeView.previusPageButton)
                            }
                            .opacity(viewModel.isHiddenButton(typeButton: .previous) ? 0 : 1)
                            .disabled(viewModel.isHiddenButton(typeButton: .previous))
                            .buttonStyle(.bordered)
                            .padding([.leading], 20)
                            
                            Spacer()
                            
                            /// Next Button
                            Button {
                                viewModel.followingPages(typeButton: .next)
                            } label: {
                                Text(L10n.HomeView.nextPageButton)
                            }
                            .opacity(viewModel.isHiddenButton(typeButton: .next) ? 0 : 1)
                            .disabled(viewModel.isHiddenButton(typeButton: .next))
                            .padding([.trailing], 20)
                            .buttonStyle(.bordered)
                        }
                        .frame(alignment: .center)
                        .padding([.bottom], 24)
                    }
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text(L10n.HomeView.homeIcon)
                    }
                }
                
                // TODO: - Put here the second screen for search
                NavigationStack {
                    List {
                        ForEach(searchResults, id: \.self) { character in
                            // TODO: - Redirect this to a detail page
                            NavigationLink {
                                Text(character)
                            } label: {
                                Text(character)
                            }
                        }
                    }
                }
                .searchable(text: $searchText)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text(L10n.SearchView.searchIcon)
                }
            }
            .accentColor(.red)
        }
    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return []
        } else {
            return viewModel.charactersFilter.filter { $0.contains(searchText) }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
