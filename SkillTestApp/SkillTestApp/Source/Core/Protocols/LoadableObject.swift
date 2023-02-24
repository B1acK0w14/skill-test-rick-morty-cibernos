//
//  LoadableObject.swift
//  SkillTestApp
//
//  Created by David Penagos on 23/02/23.
//

import Foundation

protocol LoadableObject: ObservableObject {
    var state: LoadingState { get }
    func load()
}
