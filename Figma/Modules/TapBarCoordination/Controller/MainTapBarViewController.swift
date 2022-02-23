//
//  ViewController.swift
//  Figma
//
//  Created by Владислав Пуцыкович on 5.02.22.
//

import UIKit

fileprivate struct Constants {
    static let catologImageName = "catalog"
    static let profileImageName = "profile"
    static let shopsImageName = "store"
    static let catologTitle = "Каталог"
    static let profileTitle = "Профиль"
    static let shopsTitle = "Магазины"
}

class MainTapBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createTabController()
    }
    
    func createTabController() {
        
        let catalogVC = UINavigationController(rootViewController: CatalogViewController())
        catalogVC.tabBarItem = UITabBarItem(
            title: catalogVC.navigationItem.title,
            image: UIImage(named: Constants.catologImageName),
            selectedImage: UIImage(named: Constants.catologImageName)
        )
        catalogVC.tabBarItem.title = Constants.catologTitle
        
        let shopsVC = UINavigationController(rootViewController: StoreLocationController())
        shopsVC.tabBarItem = UITabBarItem(
            title: shopsVC.navigationItem.title,
            image: UIImage(named: Constants.shopsImageName),
            selectedImage: UIImage(named: Constants.shopsImageName)
        )
        shopsVC.tabBarItem.title = Constants.shopsTitle
        
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        profileVC.tabBarItem = UITabBarItem(
            title: profileVC.navigationItem.title,
            image: UIImage(named: Constants.profileImageName),
            selectedImage: UIImage(named: Constants.profileImageName)
        )
        profileVC.tabBarItem.title = Constants.profileTitle
        
        viewControllers = [catalogVC, shopsVC, profileVC]
    }
}

