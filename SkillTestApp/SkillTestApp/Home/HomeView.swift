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
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { character in
                    NavigationLink {
                        Text(character)
                    } label: {
                        Text(character)
                    }
                }
            }
        }
        .searchable(text: $searchText)
    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return []
        } else {
            return viewModel.characters.filter { $0.contains(searchText) }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
