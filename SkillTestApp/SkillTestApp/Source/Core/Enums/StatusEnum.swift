//
//  StatusEnum.swift
//  SkillTestApp
//
//  Created by David Penagos on 24/02/23.
//

import Foundation

enum StatusEnum: Int {
    case dead = 0
    case alive = 1
    case unknown = 2
    
    var value: String {
        switch self {
        case .dead:
            return "Dead"
        case .alive:
            return "Alive"
        case .unknown:
            return "Unknown"
        }
    }
    
    func returnGenderValue(option: Int) -> String {
        return self.value
    }
}
