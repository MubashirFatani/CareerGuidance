//
//  Utility.swift
//  CareerGuidance
//
//  Created by Murtaza on 25/03/2023.
//

import Foundation
import UIKit

struct Utility
{
    static func isValid(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    static func isValid(password: String) -> Bool {
        return (password.count < 3 || password.count > 16) ? false : true
    }
}
