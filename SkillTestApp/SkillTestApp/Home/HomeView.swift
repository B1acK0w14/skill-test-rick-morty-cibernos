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
    @State private var genderSelection: Int = 0
    @State private var statusSelection: Int = 0
    
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
                    /// Character view with own cell
                    CharacterView(viewModel: viewModel,
                                  typeOfResult: viewModel.charactersResult)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text(L10n.HomeView.homeIcon)
                    }
                    
                    VStack(spacing: 15) {
                        /// Search Field
                        TextField(L10n.FilterView.Search.searchTextfieldPlaceholder, text: $searchText)
                            .textFieldStyle(.roundedBorder)
                            .padding([.leading, .trailing], 16)
                            .onSubmit {
                                viewModel.searchFunction(searchText: searchText,
                                                         genderOption: GenderEnum(rawValue: genderSelection),
                                                         statusSelection: StatusEnum(rawValue: statusSelection))
                            }
                        
                        HStack(spacing: 20) {
                            /// Gender Menu
                            Picker(String.emptyString, selection: $genderSelection) {
                                Text(L10n.FilterView.GenderMenu.female).tag(0)
                                    .minimumScaleFactor(0.1)
                                Text(L10n.FilterView.GenderMenu.male).tag(1)
                                    .minimumScaleFactor(0.1)
                                Text(L10n.FilterView.GenderMenu.genderless).tag(2)
                                    .lineLimit(1)
                                Text(L10n.FilterView.GenderMenu.unknown).tag(3)
                                    .lineLimit(1)
                            }
                            .pickerStyle(.menu)
                            .colorMultiply(.red)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.red, lineWidth: 1)
                            )
                            .minimumScaleFactor(0.1)
                            
                            /// Status Menu
                            Picker(String.emptyString, selection: $statusSelection) {
                                Text(L10n.CharacterCell.Status.dead).tag(0)
                                    .minimumScaleFactor(0.1)
                                Text(L10n.CharacterCell.Status.alive).tag(1)
                                    .minimumScaleFactor(0.1)
                                Text(L10n.CharacterCell.Status.unknown).tag(2)
                                    .lineLimit(1)
                            }
                            .pickerStyle(.menu)
                            .colorMultiply(.red)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.red, lineWidth: 1)
                            )
                            
                            Button {
                                viewModel.searchFunction(searchText: searchText,
                                                         genderOption: GenderEnum(rawValue: genderSelection),
                                                         statusSelection: StatusEnum(rawValue: statusSelection))
                            } label: {
                                Text(L10n.FilterView.Search.searchText)
                            }
                            
                        }
                        
                        Spacer()
                        
                        CharacterView(viewModel: viewModel,
                                      typeOfResult: viewModel.charactersFilter,
                                      requestedFromSearch: true)
                    }
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text(L10n.FilterView.Search.searchIcon)
                    }
                }
            }
            .accentColor(.red)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
