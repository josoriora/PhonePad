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
        self.text = words.reduce("", {$0 + ", " + $1})
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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
