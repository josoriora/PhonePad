//
//  PhoneNumberDialListFacadeTests.swift
//  PhonePadTests
//
//  Created by Julian Andres Osorio Ramirez on 29/08/21.
//

import XCTest
import PhonePad

class PhoneNumberDialListFacadeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPhoneNumberDialList() {
        let dialList = PhoneNumberDialListFacade.getList()
        let letters = ["OPERATOR", "", "ABC", "DEF", "GHI", "JKL", "MNO", "PRS", "TUV", "WXY"]
        
        for i in 0..<10 {
            let dial = dialList[i]
            
            XCTAssertEqual(dial.number, i)
            XCTAssertEqual(dial.letters, letters[i])
        }
    }
}
