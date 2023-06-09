//
//  Verificationcodegenerator.swift
//  CareerGuidance
//
//  Created by Murtaza on 23/04/2023.
//

import Foundation

import CryptoSwift

class Verificationcodegenerator {
    
    static func generateVerificationCode(length: Int) -> String {
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomBytes = (0 ..< length).map { _ in UInt8.random(in: 0 ..< UInt8.max) }
        let randomString = Data(randomBytes).base64EncodedString()
        let code = String(randomString.filter { characters.contains($0) }.prefix(length))
        return code
    }
    
}
