//
//  AppDelegate.swift
//  NinetyNineChallenge
//
//  Created by Mathis Paturle on 10/7/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private enum Constants {
        static let fontSize: CGFloat = 17
        static let fontKern: CGFloat = 0.5
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        guard let font = UIFont(name: GlobalConstants.fontNameMedium, size: Constants.fontSize) else { return true }
        let attributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.kern: Constants.fontKern
        ] as [NSAttributedString.Key : Any]
        UINavigationBar.appearance().titleTextAttributes = attributes
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

