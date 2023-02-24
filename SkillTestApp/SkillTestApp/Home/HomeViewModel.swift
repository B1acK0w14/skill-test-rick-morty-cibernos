//
//  HomeViewModel.swift
//  SkillTestApp
//
//  Created by David Penagos on 22/02/23.
//

import Foundation

class HomeViewModel: LoadableObject {
    
    // MARK: - Properties
    
    var allCharactersModel: AllCharactersModel?
    
    @Published var actualPage = 1
    @Published private(set) var state: LoadingState = .idle
    @Published var charactersFilter: [String] = []
    @Published var charactersResult: [Results] = []
    
    // MARK: - Functions
    func load() {
        state = .loading
        
        requestForCallGetAllCharacters()
    }
    
    func isHiddenButton(typeButton: TypeButton) -> Bool {
        switch typeButton {
        case .next:
            guard let totalPages = allCharactersModel?.info?.count else { return true }
            return !(totalPages > actualPage)
        case .previous:
            return actualPage == 1
        }
    }
    
    func followingPages(typeButton: TypeButton) {
        guard let followingPage = allCharactersModel?.info else { return }
        
        switch typeButton {
        case .next:
            requestForCallGetAllCharacters(page: followingPage.next ?? String.emptyString)
            
            switch state {
            case .idle, .loading, .failed(_): break
            case .loaded:
                actualPage += 1
            }
        case .previous:
            requestForCallGetAllCharacters(page: followingPage.prev ?? String.emptyString)
            
            switch state {
            case .idle, .loading, .failed(_): break
            case .loaded:
                actualPage -= 1
            }
        }
    }
    
    private func requestForCallGetAllCharacters(page: String = String.emptyString) {
        APIServices.shared.callGetAllCharacters(followingPageURL: page) { response in
            if let response = response {
                let filtered = response.results?.map { $0.name ?? String.emptyString }
                self.charactersFilter = filtered ?? []
                self.allCharactersModel = response
                self.charactersResult = response.results ?? []
                self.state = .loaded
            }
        } failure: { error in
            self.state = .failed(error)
            print(error)
        }
    }
}
