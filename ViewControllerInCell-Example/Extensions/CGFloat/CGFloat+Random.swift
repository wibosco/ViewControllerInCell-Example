//
//  CGFloat+Random.swift
//  ViewControllerInCell-Example
//
//  Created by William Boles on 03/04/2018.
//  Copyright © 2018 William Boles. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat {
    
    // MARK: - Random
    
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
