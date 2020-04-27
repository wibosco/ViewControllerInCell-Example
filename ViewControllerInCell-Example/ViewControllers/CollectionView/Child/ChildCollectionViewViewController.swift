//
//  ChildCollectionViewViewController.swift
//  ViewControllerInCell-Example
//
//  Created by William Boles on 27/04/2020.
//  Copyright © 2020 William Boles. All rights reserved.
//

import UIKit

class ChildCollectionViewViewController: UIViewController {

    static let storyboardIdentifier = "ChildCollectionViewViewController"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private lazy var viewModels: [ChildCollectionViewCellViewModel] = {
        var viewModels = [ChildCollectionViewCellViewModel]()
        
        for _ in 0...100 {
            let color = UIColor.random
            
            let ciColor = CIColor(color: color)
            let red = String(format: "%.3f", ciColor.red)
            let green = String(format: "%.3f", ciColor.green)
            let blue = String(format: "%.3f", ciColor.blue)
            let colorDescription = "RGB: (\(red), \(green), \(blue))"
            
            let viewModel = ChildCollectionViewCellViewModel(color: color, colorDescription: colorDescription)
            
            viewModels.append(viewModel)
        }
        
        return viewModels
    }()
    
    private var isFocus: Bool = false
    
    // Storyboard
    
    static func createFromStoryboard() -> ChildCollectionViewViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: ChildCollectionViewViewController.self))
        guard let viewController = storyboard.instantiateViewController(withIdentifier: ChildCollectionViewViewController.storyboardIdentifier) as? ChildCollectionViewViewController else {
            fatalError("ColorViewController should be present in storyboard")
        }
        
        return viewController
    }
    
    // MARK: - Focus
    
    func gainFocus(on index: Int) {
        isFocus = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if self.isFocus {
                print("Focus triggered on index: \(index)")
            }
        }
    }
    
    func loseFocus() {
        isFocus = false
    }
}

extension ChildCollectionViewViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 88)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

extension ChildCollectionViewViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = viewModels[indexPath.row]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChildCollectionViewCell.reuseIdentifier, for: indexPath) as? ChildCollectionViewCell else {
            fatalError("Expected cell with reuse identifier: \(ParentCollectionViewCell.reuseIdentifier)")
        }
        
        cell.configure(with: viewModel)
        
        return cell
    }
}
