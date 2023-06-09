//
//  AppDelegate.swift
//  CareerGuidance
//
//  Created by Murtaza on 14/03/2023.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase
import GoogleMaps
import GooglePlaces

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false // Optional: disable toolbar
        // Define the font you want to use
        let myFont = UIFont(name: "Arial", size: 16)

        // Set the default appearance for all UILabels
        UITextField.appearance().font = myFont


        // Override point for customization after application launch.
        FirebaseApp.configure()
        GMSServices.provideAPIKey(firebaseAPIKey)
        GMSPlacesClient.provideAPIKey(firebaseAPIKey)
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

