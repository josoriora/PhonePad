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

}

class RotaryDialViewModel {
    let numberList: PhoneNumberDialList.Type
    let letterCombinations: LetterCombinationsProtocol
    let dialList: [PhoneNumber]
    var numbers = [Int]()
    
    init(numberList: PhoneNumberDialList.Type = PhoneNumberDialListFacade.self,
         letterCombinations: LetterCombinationsProtocol = LetterCombinations()) {
        self.numberList = numberList
        self.letterCombinations = letterCombinations
        self.dialList = numberList.getList()
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
