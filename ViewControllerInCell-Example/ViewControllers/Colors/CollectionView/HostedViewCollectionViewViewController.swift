//
//  HostedViewCollectionViewViewController.swift
//  ViewControllerInCell-Example
//
//  Created by William Boles on 27/04/2020.
//  Copyright © 2020 William Boles. All rights reserved.
//

import UIKit

class HostedViewCollectionViewViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    private lazy var colorViewControllers: [ColorViewController] = {
        var colorViewControllers = [ColorViewController]()
        
        for _ in 0...100 {
            let colorViewController = ColorViewController.createFromStoryboard()

            addChildContentViewController(colorViewController)
            colorViewControllers.append(colorViewController)
        }
        
        return colorViewControllers
    }()

    // MARK: - ChildViewControllers

    private func addChildContentViewController(_ childViewController: UIViewController) {
        addChild(childViewController)
        childViewController.didMove(toParent: self)
    }
}

extension HostedViewCollectionViewViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 88.0)
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

extension HostedViewCollectionViewViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorViewControllers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let colorViewController = colorViewControllers[indexPath.row]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HostedViewCollectionViewCell.reuseIdentifier, for: indexPath) as? HostedViewCollectionViewCell else {
            fatalError("Expected cell with reuse identifier: \(HostedViewCollectionViewCell.reuseIdentifier)")
        }
        
        cell.hostedView = colorViewController.view
        
        return cell
    }
}
