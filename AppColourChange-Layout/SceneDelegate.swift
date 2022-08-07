//
//  SceneDelegate.swift
//  AppColourChange-Layout
//
//  Created by roman Khilchenko on 06.08.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let colourView = ViewController()
        let navigationController = UINavigationController(rootViewController: colourView)
        let window = UIWindow(windowScene: windowScene)
        
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }
}
