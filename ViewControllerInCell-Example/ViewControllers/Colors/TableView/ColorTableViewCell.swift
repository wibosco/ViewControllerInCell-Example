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
                guard isViewDescendantOfContentView(oldValue) else {
                    return
                }
                
                oldValue?.removeFromSuperview()
                return
            }
            
            _hostedView.frame = contentView.bounds
            contentView.addSubview(_hostedView)
        }
    }
    
    var hostedView: UIView? {
        get {
            guard isViewDescendantOfContentView(_hostedView) else {
                return nil
            }
            return _hostedView
        }
        set {
            _hostedView = newValue
        }
    }
    
    func isViewDescendantOfContentView(_ view: UIView?) -> Bool {
        return view?.isDescendant(of: contentView) ?? false
    }

    // MARK: - Reuse

    override func prepareForReuse() {
        super.prepareForReuse()
        
//        if isViewDescendantOfContentView(_hostedView) { //Make sure that hostedView hasn't been added as a subview to a different cell
//            _hostedView?.removeFromSuperview()
//        } else {
//            print("hostedView is no longer attached to this tableview cell")
//        }

        _hostedView = nil
    }
}
