//
//  TabBarController.swift
//  StartingWithViper
//
//  Created by Alexandre Lemos da Silva on 19/03/24.
//

import Foundation
import UIKit

protocol TabBarViewInterface: AnyObject {
    func setupView()
}

class TabBarController: UITabBarController {
    
    private lazy var homeVC: UIViewController = {
        let navigationController = UIViewController()
        let homeViewController = HomeRouter.createModule(using: navigationController)
        navigationController.viewControllers = [homeViewController]
        navigationController.tabBarItem.title = "Home"
        navigationController.tabBarItem.image = UIImage(systemName: "house,circle")!
        return navigationController
    }()
    
    var presenter: TabBarPresenterInterface? {
            didSet {
                presenter?.notifyViewLoaded()
            }
    }
    
    override func viewDidLoad() {
           super.viewDidLoad()
       }
    
}

extension TabBarController: TabBarViewInterface {
    
    func setupView() {
        viewControllers = [
            homeVC
        ]
    }
}
