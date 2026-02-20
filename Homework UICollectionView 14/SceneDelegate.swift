//
//  SceneDelegate.swift
//  Homework UICollectionView 14
//
//  Created by Павел Гарбацевич on 20.02.26.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        
        let vc = MoviesVC()
        let navVC = UINavigationController(rootViewController: vc)
        
        window?.makeKeyAndVisible()
        window?.rootViewController = navVC
    }
}

