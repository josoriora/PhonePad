//
//  LetterCombinations.swift
//  PhonePad
//
//  Created by Julian Andres Osorio Ramirez on 28/08/21.
//

import Foundation

public class LetterCombinations {
    
    let numberMapping = ["", "", "abc", "def", "ghi", "jkl", "mno", "prs", "tuv", "wxy"]
    
    public init() {
        
    }
    
    public func wordListFrom(numbers: [Int]) -> [String] {
        var wordsList = [String]()
        recursiveWordList(numbers: numbers, buffer: "", nextIndex: 0, wordsList: &wordsList)
        
        return wordsList
    }
        
    private func recursiveWordList(numbers: [Int], buffer: String, nextIndex: Int, wordsList: inout [String]) {
        // Termination case
        if nextIndex >= numbers.count {
            if buffer.count > 0 {
                wordsList.append(String(buffer))
            }
            return
        }
        
        // find candidates
        let letters = getLettersFor(phonePadNumber: numbers[nextIndex])
        
        // 0 and 1 validation
        if letters.count == 0 {
            recursiveWordList(numbers: numbers, buffer: buffer, nextIndex: nextIndex + 1, wordsList: &wordsList)
        }
        
        // place candidates in buffer
        for letter in letters {
            let newBuffer = buffer + String(letter)
            // recurse to next index
            recursiveWordList(numbers: numbers, buffer: newBuffer, nextIndex: nextIndex + 1, wordsList: &wordsList)
        }
    }
    
    private func getLettersFor(phonePadNumber: Int) -> String {
        guard phonePadNumber > 1 && phonePadNumber <= 9 else { return "" }
        
        return numberMapping[phonePadNumber]
    }
}
