//
//  RotaryDialView.swift
//  PhonePad
//
//  Created by Julian Andres Osorio Ramirez on 29/08/21.
//

import UIKit

protocol RotaryDialDataSource: AnyObject {
    func numberOfDials() -> Int
    
    func numberAt(indexPath: IndexPath) -> PhoneKeypad?
}

protocol RotaryDialDelegate: AnyObject {
    func didSelectDialAt(indexPath: IndexPath)
}

class RotaryDialView: UIView {
    var collectionView: UICollectionView!
    let cellIdentifier = "ItemCell"
    weak var dataSource: RotaryDialDataSource?
    weak var delegate: RotaryDialDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    //common func to init our view
    private func setupView() {
        backgroundColor = .red
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let circleCollectionLayout = CircleCollectionViewLayout()
        
        collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: circleCollectionLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.gray
        collectionView.register(CircleCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        
        self.addSubview(collectionView)
        
        let constraints = [collectionView.topAnchor.constraint(equalTo: self.topAnchor),
                           collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                           collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                           collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)]
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension RotaryDialView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let numberOfDials = self.dataSource?.numberOfDials() else { return 0 }
        
        return numberOfDials > 0 ? 1 : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource?.numberOfDials() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let keypad = self.dataSource?.numberAt(indexPath: indexPath),
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? CircleCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        cell.backgroundView?.backgroundColor = .darkGray
        cell.titleLabel.text = String(keypad.number)
        cell.subtitleLabel.text = keypad.letters
        return cell
    }
}

extension RotaryDialView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.didSelectDialAt(indexPath: indexPath)
    }
}
