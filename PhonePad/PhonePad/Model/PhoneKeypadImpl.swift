//
//  PhoneNumberImpl.swift
//  PhonePad
//
//  Created by Julian Andres Osorio Ramirez on 29/08/21.
//

import Foundation

public struct PhoneKeypadImpl: PhoneKeypad {
    public var number: Int
    
    public var letters: String
    
    public init(number: Int, letters: String) {
        self.number = number
        self.letters = letters
    }
}
