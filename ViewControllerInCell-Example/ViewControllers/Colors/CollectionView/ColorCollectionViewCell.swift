//
//  ColorsCollectionViewCell.swift
//  ViewControllerInCell-Example
//
//  Created by William Boles on 27/04/2020.
//  Copyright © 2020 William Boles. All rights reserved.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ColorCollectionViewCell"
    
    // MARK: - HostedView

    var hostedView: UIView? {
        didSet {
            guard let hostedView = hostedView else {
                return
            }
            
            hostedView.frame = contentView.bounds
            contentView.addSubview(hostedView)
        }
    }

    // MARK: - Reuse

    override func prepareForReuse() {
        super.prepareForReuse()
        
        if hostedView?.superview == contentView { //Make sure that hostedView hasn't been added as a subview to a different cell
            hostedView?.removeFromSuperview()
        } else {
            print("hostedView is no longer attached to this collectionview cell")
        }

        hostedView = nil
    }
}
