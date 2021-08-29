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
}

class LetterCombinations {
    
    let letterMapping = ["0", "1", "abc", "def", "ghi", "jkl", "mno", "prs", "tuv", "wxy"]
    
    func wordListFrom(numbers: [Int]) -> [String] {
        guard let number = numbers.first, number > 1, number <= 9 else {
            return [String]()
        }
        
        return letterMapping[numbers.first!].map { String($0) }
    }
}
