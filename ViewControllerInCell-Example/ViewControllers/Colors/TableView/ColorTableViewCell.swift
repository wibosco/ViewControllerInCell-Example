//
//  ColorTableViewCell.swift
//  ViewControllerInCell-Example
//
//  Created by William Boles on 03/04/2018.
//  Copyright © 2018 William Boles. All rights reserved.
//

import UIKit

class ColorTableViewCell: UITableViewCell {

    static let reuseIdentifier = "ColorTableViewCell"
    
    // MARK: - HostedView

    private var _hostedView: UIView? {
        didSet {
            guard let _hostedView = _hostedView else {
                return
            }
            
            _hostedView.frame = contentView.bounds
            contentView.addSubview(_hostedView)
        }
    }
    
    private var isHostedViewInViewHierarchy: Bool {
        return _hostedView?.superview == contentView
    }
    
    var hostedView: UIView? {
        get {
            guard isHostedViewInViewHierarchy else {
                return nil
            }
            return _hostedView
        }
        set {
            _hostedView = newValue
        }
    }

    // MARK: - Reuse

    override func prepareForReuse() {
        super.prepareForReuse()
        
        if isHostedViewInViewHierarchy { //Make sure that hostedView hasn't been added as a subview to a different cell
            _hostedView?.removeFromSuperview()
        } else {
            print("hostedView is no longer attached to this tableview cell")
        }

        _hostedView = nil
    }
}
