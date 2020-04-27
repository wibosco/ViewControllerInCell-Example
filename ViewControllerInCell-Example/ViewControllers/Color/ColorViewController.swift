//
//  ColorViewController.swift
//  ViewControllerInCell-Example
//
//  Created by William Boles on 03/04/2018.
//  Copyright © 2018 William Boles. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    static let storyboardIdentifier = "ColorViewControllerIdentifier"
    
    @IBOutlet weak var colorInfoLabel: UILabel!
    
    // MARK: - ViewLifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let color = UIColor.random
        view.backgroundColor = color
        
        let ciColor = CIColor(color: color)
        let red = String(format: "%.3f", ciColor.red)
        let green = String(format: "%.3f", ciColor.green)
        let blue = String(format: "%.3f", ciColor.blue)
        colorInfoLabel.text = "RGB: (\(red), \(green), \(blue))"
    }
    
    // Storyboard
    
    static func createFromStoryboard() -> ColorViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: ColorViewController.self))
        guard let viewController = storyboard.instantiateViewController(withIdentifier: ColorViewController.storyboardIdentifier) as? ColorViewController else {
            fatalError("ColorViewController should be present in storyboard")
        }
        
        return viewController
    }
}
