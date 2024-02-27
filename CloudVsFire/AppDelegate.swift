//
//  AppDelegate.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 2/26/24.
//

import Firebase
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    
    // swiftlint:disable all
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        print("Application is starting up... ApplicationDelegate didFinishLaunchingWithOptions.")
        FirebaseApp.configure()
        return true
    }
    // swiftlint:disable all
}
