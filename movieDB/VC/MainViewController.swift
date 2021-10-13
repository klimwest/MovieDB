//
//  MainViewController.swift
//  movieDB
//
//  Created by West on 7.10.21.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        view.backgroundColor = .black
        //set tabBar
        let tabBar = UITabBarController()
        let main = UINavigationController(rootViewController: MainTabViewController())
        let favorites = UINavigationController(rootViewController: FavoritesTabViewController())
        let settings = UINavigationController(rootViewController: SettingsTabViewController())
        main.title = "Main"
        favorites.title = "Favorites"
        settings.title = "Settings"
        tabBar.setViewControllers([main, favorites, settings], animated: false)
        //icons for bars
        guard let items = tabBar.tabBar.items else { return }
        let images = ["house", "star", "gear"]
        for icon in 0..<items.count {
            items[icon].image = UIImage(systemName: images[icon])
        }
        tabBar.modalPresentationStyle = .fullScreen
        present(tabBar, animated: true)
    }
    
}
