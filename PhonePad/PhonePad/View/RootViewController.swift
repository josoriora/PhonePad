//
//  RootViewController.swift
//  PhonePad
//
//  Created by Julian Andres Osorio Ramirez on 28/08/21.
//

import UIKit

class RootViewController: UIViewController {

    @IBOutlet weak var numbersLabel: UILabel!
    @IBOutlet weak var rotaryDialView: RotaryDialView!
    let viewModel = RotaryDialViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Phone Pad"
        rotaryDialView.dataSource = self
        rotaryDialView.delegate = self
    }
    
    @IBAction func onPrintWords(_ sender: Any) {
    }
}

extension RootViewController: RotaryDialDataSource {
    func numberOfDials() -> Int {
        return viewModel.dialList.count
    }
    
    func numberAt(indexPath: IndexPath) -> PhoneNumber? {
        return viewModel.dialList[indexPath.row]
    }
}

extension RootViewController: RotaryDialDelegate {
    func didSelectDialAt(indexPath: IndexPath) {
        let phoneNumber = viewModel.dialList[indexPath.row]
        
        viewModel.append(number: phoneNumber.number)
        self.numbersLabel.text = viewModel.numbersText
    }
}
