//
//  ColorsViewController.swift
//  ViewControllerInCell-Example
//
//  Created by William Boles on 03/04/2018.
//  Copyright © 2018 William Boles. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var colorViewControllers: [ColorViewController] = {
        var colorViewControllers = [ColorViewController]()
        
        for _ in 0...100 {
            let colorViewController = ColorViewController.createFromStoryboard()

            addChildContentViewController(colorViewController)
            colorViewControllers.append(colorViewController)
        }
        
        return colorViewControllers
    }()
    
    // MARK: - ViewLifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 88
    }
    
    // MARK: - ChildViewControllers
    
    private func addChildContentViewController(_ childViewController: UIViewController) {
        addChildViewController(childViewController)
        childViewController.didMove(toParentViewController: self)
    }
}

extension ColorsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorViewControllers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let colorViewController = colorViewControllers[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ColorTableViewCell.reuseIdentifier, for: indexPath) as? ColorTableViewCell else {
            fatalError("Expected cell with reuse identifier: \(ColorTableViewCell.reuseIdentifier)")
        }
        
        cell.hostedView = colorViewController.view
        
        return cell
    }
}
