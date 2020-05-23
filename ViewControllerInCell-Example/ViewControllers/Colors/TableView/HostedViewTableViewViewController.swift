//
//  HostedViewTableViewViewController.swift
//  ViewControllerInCell-Example
//
//  Created by William Boles on 03/04/2018.
//  Copyright © 2018 William Boles. All rights reserved.
//

import UIKit

class HostedViewTableViewViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private lazy var colorViewControllers: [ColorViewController] = {
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
        addChild(childViewController)
        childViewController.didMove(toParent: self)
    }
}

extension HostedViewTableViewViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorViewControllers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let colorViewController = colorViewControllers[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HostedViewTableViewCell.reuseIdentifier, for: indexPath) as? HostedViewTableViewCell else {
            fatalError("Expected cell with reuse identifier: \(HostedViewTableViewCell.reuseIdentifier)")
        }
        
        cell.hostedView = colorViewController.view
        
        return cell
    }
}
