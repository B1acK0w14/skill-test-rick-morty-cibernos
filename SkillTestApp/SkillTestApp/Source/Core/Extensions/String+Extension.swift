//
//  String+Extension.swift
//  SkillTestApp
//
//  Created by David Penagos on 22/02/23.
//

import Foundation

extension String {
    
    /// Static declaration of an empty string. Use this instead of in-line ""
    public static var emptyString: String { return "" }
}

extension Optional where Wrapped == String {
    
    /// Validation if an string is nil or empty
    var isEmptyOrNil: Bool {
        return self?.isEmpty ?? true
    }
}
