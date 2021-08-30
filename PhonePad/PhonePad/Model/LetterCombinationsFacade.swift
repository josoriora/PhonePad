//
//  LetterCombinationsFacade.swift
//  PhonePad
//
//  Created by Julian Andres Osorio Ramirez on 30/08/21.
//

import Foundation

public protocol LetterCombinationsFacadeProtocol {
    static func wordListFrom(numbers: [Int], completion: @escaping ([String]) -> ())
}

public class LetterCombinationsFacade: LetterCombinationsFacadeProtocol {
    public static func wordListFrom(numbers: [Int], completion: @escaping ([String]) -> ()) {
        DispatchQueue.global(qos: .userInitiated).async {
            let letterCombinationss = LetterCombinations()
            let words = letterCombinationss.wordListFrom(numbers: numbers)
            
            DispatchQueue.main.async {
                completion(words)
            }
        }
    }
}
