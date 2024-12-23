//
//  PhoneNumber.swift
//  PhonePad
//
//  Created by Julian Andres Osorio Ramirez on 29/08/21.
//

import Foundation

public protocol PhoneKeypad {
    var number: Int { get set }
    var letters: String { get set }
}
