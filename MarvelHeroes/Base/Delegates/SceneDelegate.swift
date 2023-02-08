//
//  SceneDelegate.swift
//  MarvelCharacters
//
//  Created by Andrés A. on 5/3/22.
//  Copyright © 2022 Andrés A.. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        
        let vc = ListCharactersViewController()
        self.window?.rootViewController = navigationController
        navigationController.pushViewController(vc, animated: true)
        self.window?.makeKeyAndVisible()
    }
    
}

