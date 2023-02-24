//
//  GenderEnum.swift
//  SkillTestApp
//
//  Created by David Penagos on 24/02/23.
//

import Foundation

enum GenderEnum: Int {
    case female = 0
    case male = 1
    case genderless = 2
    case unknown = 3
    
    var value: String {
        switch self {
        case .female:
            return "Female"
        case .male:
            return "Male"
        case .genderless:
            return "Genderless"
        case .unknown:
            return "Unknown"
        }
    }
    
    func returnGenderValue(option: Int) -> String {
        return self.value
    }
}
