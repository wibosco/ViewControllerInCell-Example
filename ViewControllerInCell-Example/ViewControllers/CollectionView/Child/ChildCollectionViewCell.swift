//
//  ChildCollectionViewCell.swift
//  ViewControllerInCell-Example
//
//  Created by William Boles on 27/04/2020.
//  Copyright © 2020 William Boles. All rights reserved.
//

import UIKit

struct ChildCollectionViewCellViewModel {
    let color: UIColor
    let colorDescription: String
}

class ChildCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ChildCollectionViewCell"
    
    @IBOutlet weak var colorInfoLabel: UILabel!
    
    // MARK: - Configure
    
    func configure(with viewModel: ChildCollectionViewCellViewModel) {
        backgroundColor = viewModel.color
        colorInfoLabel.text = viewModel.colorDescription
    }
}
