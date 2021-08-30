//
//  RootViewController.swift
//  PhonePad
//
//  Created by Julian Andres Osorio Ramirez on 28/08/21.
//

import UIKit

class RootViewController: UIViewController {

    @IBOutlet weak var rotaryDialView: RotaryDialView!
    var phoneNumbers: [PhoneNumber] = PhoneNumberDialListFacade.getList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Phone Pad"
        rotaryDialView.dataSource = self
    }
    
}

extension RootViewController: RotaryDialDataSource {
    
    func numberOfDials() -> Int {
        return phoneNumbers.count
    }
    
    func numberAt(indexPath: IndexPath) -> PhoneNumber? {
        return phoneNumbers[indexPath.row]
    }
    
}
