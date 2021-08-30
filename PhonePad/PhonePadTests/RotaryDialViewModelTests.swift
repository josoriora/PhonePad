//
//  RotaryDialViewModelTests.swift
//  PhonePadTests
//
//  Created by Julian Andres Osorio Ramirez on 29/08/21.
//

import XCTest
import PhonePad

class RotaryDialViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testViewModelInitialization() {
        let numberListProvider = PhoneNumberDialListMock.self
        let letterCombinations = LetterCombinationsMock()
        let viewModel = RotaryDialViewModel(numberList: numberListProvider, letterCombinations: letterCombinations)
        
        XCTAssertNotNil(viewModel)
        XCTAssertEqual(viewModel.numbers.count, 0)
        XCTAssertEqual(viewModel.dialList.count, numberListProvider.getList().count)
    }
    
    func testViewModelNumberAppend() {
        let viewModel = RotaryDialViewModel()
        let number = 5
        
        XCTAssertFalse(viewModel.numbers.contains(number))
        
        viewModel.append(number: number)
        
        XCTAssertTrue(viewModel.numbers.contains(number))
    }
    
    func testViewModelNumbersText() {
        let viewModel = RotaryDialViewModel()
        
        viewModel.append(number: 5)
        viewModel.append(number: 4)
        viewModel.append(number: 3)
        viewModel.append(number: 2)
        viewModel.append(number: 1)
        
        XCTAssertEqual(viewModel.numbersText, "54321")
    }
    
    func testViewModelWordsCalculation() {
        let viewModel = RotaryDialViewModel()
        let number = 5
        
        viewModel.append(number: number)
        XCTAssertEqual(viewModel.getCurrentWordList(), LetterCombinations().wordListFrom(numbers: [number]))
    }
}

class PhoneNumberDialListMock: PhoneNumberDialList {
    static func getList() -> [PhoneNumber] {
        return [PhoneNumberImpl(number: 2, letters: "abc")]
    }
}

class LetterCombinationsMock: LetterCombinationsProtocol {
    func wordListFrom(numbers: [Int]) -> [String] {
        return [String]()
    }
}
