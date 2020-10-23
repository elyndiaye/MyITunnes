//
//  SceneDelegate.swift
//  iTunnes
//
//  Created by ely.assumpcao.ndiaye on 17/10/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        
        window?.rootViewController = updateTabBar()
        
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    func updateTabBar() -> UITabBarController {
           let tabbar = UITabBarController()
           UITabBar.appearance().tintColor = .red
        
           tabbar.viewControllers = [createSearchITunnesVC(),createMoviesSearchITunnesVC(),createFavoritesVC()]
           return tabbar
       }
    
    func createSearchITunnesVC() -> UINavigationController {
        let searchITunnesVC = SearchITunnesViewController()
        let navController = UINavigationController(rootViewController: searchITunnesVC)
        searchITunnesVC.title = "Search"
        searchITunnesVC.tabBarItem = UITabBarItem(
            title: "Search",
            image: UIImage.init(named: "search_icon")?.withRenderingMode(.alwaysTemplate), tag: 1)
        return navController
    }
    
    func createMoviesSearchITunnesVC() -> UINavigationController {
        let searchITunnesVC = SearchMoviesItunnesViewController()
        let navController = UINavigationController(rootViewController: searchITunnesVC)
        searchITunnesVC.title = "Movies"
        searchITunnesVC.tabBarItem = UITabBarItem(
            title: "Movies",
            image: UIImage.init(named: "search_icon")?.withRenderingMode(.alwaysTemplate), tag: 1)
        return navController
    }
    
    func createFavoritesVC() -> UINavigationController {
        let favoritesVC = FavoriteViewController()
        let navController = UINavigationController(rootViewController: favoritesVC)
        favoritesVC.title = "Favorite"
        favoritesVC.tabBarItem = UITabBarItem(
            title: "Favorite",
            image: UIImage.init(named: "favorite_empty_icon")?.withRenderingMode(.alwaysTemplate), tag: 1)
        return navController
    }
    
    func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = .yellow
    }


}

