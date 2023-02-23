//
//  HomeViewModel.swift
//  SkillTestApp
//
//  Created by David Penagos on 22/02/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    // MARK: - Properties
    // TODO: - Put here complete list for all characters of the TV show
    let characters = ["Holly", "Josh", "Rhonda", "Ted"]
    @Published var getAllCharactersResponse: AllCharactersModel?
    
    // MARK: - Initializers
    init() {
        bringAllCharacters()
    }
    
    // MARK: - Functions
    func bringAllCharacters() {
        APIServices.shared.callGetAllCharacters { response in
            if let response = response {
                print(response)
            }
        } failure: { error in
            print(error)
        }
    }
}
