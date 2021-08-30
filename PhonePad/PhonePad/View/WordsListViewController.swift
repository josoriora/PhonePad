//
//  WordsListViewController.swift
//  PhonePad
//
//  Created by Julian Andres Osorio Ramirez on 29/08/21.
//

import UIKit

class WordsListViewController: UIViewController {
    let words: [String]
    let text: String
    
    @IBOutlet weak var textView: UITextView!
    
    init(words: [String]) {
        self.words = words
        self.text = words.reduce("", {$0 + $1 + ", "})
        super.init(nibName: "WordsListViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Words list"
        self.textView.text = text
    }
}
