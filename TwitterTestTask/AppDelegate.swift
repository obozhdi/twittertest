//
//  AppDelegate.swift
//  TwitterTestTask
//
//  Created by obozhdi on 05/02/2017.
//  Copyright © 2017 obozhdi. All rights reserved.
//

import UIKit
import CoreData
import SwifteriOS

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        Swifter.handleOpenURL(url)
        
        return true
    }
}
