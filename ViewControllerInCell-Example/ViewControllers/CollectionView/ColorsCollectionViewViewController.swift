//
//  ColorsCollectionViewViewController.swift
//  ViewControllerInCell-Example
//
//  Created by William Boles on 27/04/2020.
//  Copyright © 2020 William Boles. All rights reserved.
//

import UIKit

class ParentCollectionViewViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    lazy var childCollectionViewViewControllers: [ChildCollectionViewViewController] = {
        var childCollectionViewViewControllers = [ChildCollectionViewViewController]()
        
        for _ in 0...100 {
            let childCollectionViewViewController = ChildCollectionViewViewController.createFromStoryboard()

            addChildContentViewController(childCollectionViewViewController)
            childCollectionViewViewControllers.append(childCollectionViewViewController)
        }
        
        return childCollectionViewViewControllers
    }()

    // MARK: - ViewLifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - ChildViewControllers

    private func addChildContentViewController(_ childViewController: UIViewController) {
        addChildViewController(childViewController)
        childViewController.didMove(toParentViewController: self)
    }
}

extension ParentCollectionViewViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
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

extension ParentCollectionViewViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childCollectionViewViewControllers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let childCollectionViewViewController = childCollectionViewViewControllers[indexPath.row]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ParentCollectionViewCell.reuseIdentifier, for: indexPath) as? ParentCollectionViewCell else {
            fatalError("Expected cell with reuse identifier: \(ParentCollectionViewCell.reuseIdentifier)")
        }
        
        cell.hostedView = childCollectionViewViewController.view
        
        return cell
    }
}
