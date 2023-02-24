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
    @Published var charactersFilter: [Results] = []
    @Published var charactersResult: [Results] = []
    @Published var searchText: String = String.emptyString
    @Published var nextButtonDisable: Bool = false
    @Published var prevButtonDisable: Bool = true
    
    // MARK: - Functions
    func load() {
        state = .loading
        
        requestForCallGetAllCharacters()
    }
    
    func isHiddenButton(typeButton: TypeButton) {
        switch typeButton {
        case .next:
            guard let _ = allCharactersModel?.info?.next else {
                nextButtonDisable = true
                return
            }
            nextButtonDisable = false
        case .previous:
            guard let _ = allCharactersModel?.info?.prev else {
                prevButtonDisable = true
                return
            }
            prevButtonDisable = false
        }
    }
    
    func followingPages(typeButton: TypeButton, requestedForSearch: Bool = false) {
        guard let followingPage = allCharactersModel?.info else { return }
        
        switch typeButton {
        case .next:
            requestForCallGetAllCharacters(page: followingPage.next ?? String.emptyString,
                                           requestedForSearch: requestedForSearch)
            
            
            switch state {
            case .idle, .loading, .failed(_): break
            case .loaded:
                actualPage += 1
                isHiddenButton(typeButton: .next)
            }
        case .previous:
            requestForCallGetAllCharacters(page: followingPage.prev ?? String.emptyString,
                                           requestedForSearch: requestedForSearch)
            
            
            switch state {
            case .idle, .loading, .failed(_): break
            case .loaded:
                actualPage -= 1
                isHiddenButton(typeButton: .previous)
            }
        }
    }
    
    private func requestForCallGetAllCharacters(page: String = String.emptyString,
                                                parameters: [String: Any]? = nil,
                                                requestedForSearch: Bool = false) {
        APIServices.shared.callGetAllCharacters(followingPageURL: page, parametersToSend: parameters) { response in
            if let response = response {
                /// Load only data for filter view or for all characters view
                if requestedForSearch {
                    self.allCharactersModel = response
                    self.charactersFilter = response.results ?? []
                } else {
                    self.allCharactersModel = response
                    self.charactersResult = response.results ?? []
                }
                
                self.isHiddenButton(typeButton: .next)
                self.isHiddenButton(typeButton: .previous)
                self.state = .loaded
            }
        } failure: { error in
            self.state = .failed(error)
            print(error)
        }
    }
    
    func searchFunction(searchText: String,
                        genderOption: GenderEnum?,
                        statusSelection: StatusEnum?) {
        state = .loading
        actualPage = 1
        
        let parametersToSend: [String: Any] = ["name": searchText,
                                               "gender": genderOption?.value ?? String.emptyString,
                                               "status": statusSelection?.value ?? String.emptyString]
        requestForCallGetAllCharacters(parameters: parametersToSend, requestedForSearch: true)
    }
}
