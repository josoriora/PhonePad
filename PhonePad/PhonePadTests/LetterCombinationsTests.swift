//
//  LetterCombinationsTests.swift
//  PhonePadTests
//
//  Created by Julian Andres Osorio Ramirez on 28/08/21.
//

import XCTest

class LetterCombinationsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testOneDigitinput() {
        let letterCombinations = LetterCombinations()
        
        XCTAssertEqual(letterCombinations.wordListFrom(numbers: [0]), [String]())
        XCTAssertEqual(letterCombinations.wordListFrom(numbers: [1]), [String]())
        XCTAssertEqual(letterCombinations.wordListFrom(numbers: [2]), ["a", "b", "c"])
        XCTAssertEqual(letterCombinations.wordListFrom(numbers: [3]), ["d", "e", "f"])
        XCTAssertEqual(letterCombinations.wordListFrom(numbers: [4]), ["g", "h", "i"])
        XCTAssertEqual(letterCombinations.wordListFrom(numbers: [5]), ["j", "k", "l"])
        XCTAssertEqual(letterCombinations.wordListFrom(numbers: [6]), ["m", "n", "o"])
        XCTAssertEqual(letterCombinations.wordListFrom(numbers: [7]), ["p", "r", "s"])
        XCTAssertEqual(letterCombinations.wordListFrom(numbers: [8]), ["t", "u", "v"])
        XCTAssertEqual(letterCombinations.wordListFrom(numbers: [9]), ["w", "x", "y"])
    }
    
    func testTwoDigitInput() {
        let letterCombinations = LetterCombinations()
        
        XCTAssertEqual(letterCombinations.wordListFrom(numbers: [2, 4]), ["ag", "ah", "ai", "bg", "bh", "bi", "cg", "ch", "ci"])
    }
}

class LetterCombinations {
    
    let numberMapping = ["", "", "abc", "def", "ghi", "jkl", "mno", "prs", "tuv", "wxy"]
    
    func wordListFrom(numbers: [Int]) -> [String] {
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
        let letters = numberMapping[numbers[nextIndex]]
        
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
}
