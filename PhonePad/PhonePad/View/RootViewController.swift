//
//  RootViewController.swift
//  PhonePad
//
//  Created by Julian Andres Osorio Ramirez on 28/08/21.
//

import UIKit

class RootViewController: UIViewController {
       
    @IBOutlet weak var collectionView: UICollectionView!
    
    enum ReuseIdentifier: String {
        case item = "ItemCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Phone Pad"
        collectionView!.register(CircleCollectionViewCell.self, forCellWithReuseIdentifier: ReuseIdentifier.item.rawValue)
    }
    
    private var items: [UIColor] = [.random(),
                                    .random(),
                                    .random(),
                                    .random(),
                                    .random(),
                                    .random(),
                                    .random(),
                                    .random(),
                                    .random(),
                                    .random()]

}

extension RootViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return items.count > 0 ? 1 : 0
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.item.rawValue, for: indexPath) as! CircleCollectionViewCell
        cell.backgroundView?.backgroundColor = items[indexPath.item]
        cell.titleLabel.text = "\(indexPath.item)"
        return cell
    }
}

private extension UIColor {
    class func random() -> UIColor {
        return UIColor(hue: .random(in: 0.0...1.0),
                       saturation: .random(in: 0.5...1.0),
                       brightness: .random(in: 0.5...1.0), alpha: 1.0)
    }
}
