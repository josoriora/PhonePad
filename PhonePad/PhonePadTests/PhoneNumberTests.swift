//
//  PhoneNumberTests.swift
//  PhonePadTests
//
//  Created by Julian Andres Osorio Ramirez on 29/08/21.
//

import XCTest
import PhonePad

class PhoneNumberTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNumberInitialization() {
        let number = 0
        let letters = "operator"
        let phoneNumber: PhoneNumber = PhoneNumberImpl(number: number, letters: letters)
        
        XCTAssertNotNil(phoneNumber)
        XCTAssertEqual(phoneNumber.number, 0)
        XCTAssertEqual(phoneNumber.letters, letters)
    }
}
