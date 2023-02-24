//
//  LoadingStates.swift
//  SkillTestApp
//
//  Created by David Penagos on 23/02/23.
//

import Foundation

enum LoadingState {
    case idle
    case loading
    case failed(String)
    case loaded
}
