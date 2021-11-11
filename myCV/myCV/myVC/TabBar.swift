//
//  TabBar.swift
//  myCV
//
//  Created by Leonid on 10.11.2021.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
    }

    
    private func setupVCs() {
        viewControllers = [
            createNavController(for: MyInfoViewController(), title: NSLocalizedString("Информация", comment: ""), image: UIImage(systemName: "magnifyingglass")!),
            createNavController(for: SkillViewController(), title: NSLocalizedString("Навыки", comment: ""), image: UIImage(systemName: "house")!),
            createNavController(for: HobbieViewController(), title: NSLocalizedString("Увлечения", comment: ""), image: UIImage(systemName: "person")!)
        ]
    }
    
    private func createNavController(for rootViewController: UIViewController,
                                                     title: String,
                                                     image: UIImage) -> UIViewController {
           let navController = UINavigationController(rootViewController: rootViewController)
           navController.tabBarItem.title = title
           navController.tabBarItem.image = image
           navController.navigationBar.prefersLargeTitles = true
           rootViewController.navigationItem.title = title
           return navController
       }
}
