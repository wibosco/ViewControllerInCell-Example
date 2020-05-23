//
//  HostedViewTableViewCell.swift
//  ViewControllerInCell-Example
//
//  Created by William Boles on 03/04/2018.
//  Copyright © 2018 William Boles. All rights reserved.
//

import UIKit
import os

class HostedViewTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "HostedViewTableViewCell"
    
    // MARK: - HostedView
    
    private weak var _hostedView: UIView? {
        didSet {
            if let oldValue = oldValue {
                if oldValue.isDescendant(of: self) { //Make sure that hostedView hasn't been added as a subview to a different cell
                    oldValue.removeFromSuperview()
                } else {
                    os_log(.info, "hostedView is no longer attached to this tableview cell")
                }
            }
            
            if let _hostedView = _hostedView {
                _hostedView.frame = contentView.bounds
                contentView.addSubview(_hostedView)
            }
        }
    }
    
    weak var hostedView: UIView? {
        get {
            guard _hostedView?.isDescendant(of: self) ?? false else {
                _hostedView = nil
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
        
        hostedView = nil
    }
}
