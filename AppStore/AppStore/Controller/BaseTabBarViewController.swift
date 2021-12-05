//
//  BaseTabBarViewController.swift
//  AppStore
//
//  Created by Jorge de Carvalho on 02/12/21.
//

import Foundation
import UIKit

class BaseTabBarViewController: UITabBarController  {
    
    var arrayViewControllers = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = UIColor(named: "TranslucentWhite")
        
        createTabItem(viewController: UIViewController(), title: "Today", icon: "icone-hoje")
        createTabItem(viewController: AppsViewController(), title: "Apps", icon: "icone-apps")
        createTabItem(viewController: SearchViewController(), title: "Search", icon: "icone-busca")
        
        viewControllers = arrayViewControllers
        
        selectedIndex = 1
        
    }
    
    func createTabItem(viewController: UIViewController, title: String, icon: String) {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        
        let image = UIImage(named: icon)
        viewController.navigationItem.title = title
        viewController.navigationItem.hidesSearchBarWhenScrolling = false
        viewController.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: image)
        viewController.view.backgroundColor = .white
        
        arrayViewControllers.append(navController)
    }
}
