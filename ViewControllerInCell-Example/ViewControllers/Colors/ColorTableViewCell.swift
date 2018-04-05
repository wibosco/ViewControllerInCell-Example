//
//  ColorTableViewCell.swift
//  ViewControllerInCell-Example
//
//  Created by William Boles on 03/04/2018.
//  Copyright © 2018 William Boles. All rights reserved.
//

import UIKit

class ColorTableViewCell: UITableViewCell {

    static let reuseIdentifier = "ColorTableViewCellIdentifier"
    
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
            print("hostedView is no longer attached to this cell")
        }

        hostedView = nil
    }
}
