//
//  RotaryDialViewModel.swift
//  PhonePad
//
//  Created by Julian Andres Osorio Ramirez on 29/08/21.
//

import Foundation

public class RotaryDialViewModel {
    public let numberList: PhoneKeypadList.Type
    public let letterCombinations: LetterCombinationsFacadeProtocol.Type
    public let dialList: [PhoneKeypad]
    public private(set) var numbers = [Int]()
    public var numbersText: String {
        numbers.reduce("") { $0 + String($1) }
    }
    
    public init(numberList: PhoneKeypadList.Type = PhoneKeypadListFacade.self,
                letterCombinations: LetterCombinationsFacadeProtocol.Type = LetterCombinationsFacade.self) {
        self.numberList = numberList
        self.letterCombinations = letterCombinations
        self.dialList = numberList.getList()
    }
    
    public func append(number: Int) {
        self.numbers.append(number)
    }
    
    public func getCurrentWordList(completion: @escaping ([String]) -> ()) -> () {
        self.letterCombinations.wordListFrom(numbers: numbers, completion: completion)
    }
}
