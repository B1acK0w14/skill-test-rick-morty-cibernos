//
//  TraccarEndpoint.swift
//  SkillTestApp
//
//  Created by David Penagos on 23/02/23.
//

import Foundation

enum TraccarEndpoint {
    
    case allCharacters

    var baseURL: URL {
        return URL(string: L10n.baseURL)!
    }

    var path: String {
        switch self {
        case .allCharacters:
            return L10n.URLEndpoint.allCharacters
        }
    }

    var url: URL {
        return URL(string: path, relativeTo: baseURL)!
    }
}
