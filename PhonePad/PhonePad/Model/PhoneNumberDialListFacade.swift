//
//  PhoneNumberDialListFacade.swift
//  PhonePad
//
//  Created by Julian Andres Osorio Ramirez on 29/08/21.
//

import Foundation

public class PhoneNumberDialListFacade {
    public static func getList() -> [PhoneNumber] {
        var dialList = [PhoneNumber]()
        
        dialList.append(PhoneNumberImpl(number: 0, letters: "OPERATOR"))
        dialList.append(PhoneNumberImpl(number: 1, letters: ""))
        dialList.append(PhoneNumberImpl(number: 2, letters: "ABC"))
        dialList.append(PhoneNumberImpl(number: 3, letters: "DEF"))
        dialList.append(PhoneNumberImpl(number: 4, letters: "GHI"))
        dialList.append(PhoneNumberImpl(number: 5, letters: "JKL"))
        dialList.append(PhoneNumberImpl(number: 6, letters: "MNO"))
        dialList.append(PhoneNumberImpl(number: 7, letters: "PRS"))
        dialList.append(PhoneNumberImpl(number: 8, letters: "TUV"))
        dialList.append(PhoneNumberImpl(number: 9, letters: "WXY"))
        
        return dialList
    }
}
