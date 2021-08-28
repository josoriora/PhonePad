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
    
    func test2input() {
        let letterCombinations = LetterCombinations()
        
        XCTAssertEqual(letterCombinations.wordListFrom(numbers: [2]), ["A", "B", "C"])
    }
}

class LetterCombinations {
    func wordListFrom(numbers: [Int]) -> [String] {
        return [String]()
    }
}
