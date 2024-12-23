//
//  PhoneNumberDialListFacade.swift
//  PhonePad
//
//  Created by Julian Andres Osorio Ramirez on 29/08/21.
//

import Foundation

public protocol PhoneKeypadList {
    static func getList() -> [PhoneKeypad]
}

public class PhoneKeypadListFacade: PhoneKeypadList {
    public static func getList() -> [PhoneKeypad] {
        var dialList = [PhoneKeypad]()
        
        dialList.append(PhoneKeypadImpl(number: 0, letters: "OPERATOR"))
        dialList.append(PhoneKeypadImpl(number: 1, letters: ""))
        dialList.append(PhoneKeypadImpl(number: 2, letters: "ABC"))
        dialList.append(PhoneKeypadImpl(number: 3, letters: "DEF"))
        dialList.append(PhoneKeypadImpl(number: 4, letters: "GHI"))
        dialList.append(PhoneKeypadImpl(number: 5, letters: "JKL"))
        dialList.append(PhoneKeypadImpl(number: 6, letters: "MNO"))
        dialList.append(PhoneKeypadImpl(number: 7, letters: "PRS"))
        dialList.append(PhoneKeypadImpl(number: 8, letters: "TUV"))
        dialList.append(PhoneKeypadImpl(number: 9, letters: "WXY"))
        
        return dialList
    }
}
