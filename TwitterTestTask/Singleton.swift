//
//  Sigleton.swift
//  TwitterTestTask
//
//  Created by obozhdi on 07/02/2017.
//  Copyright © 2017 obozhdi. All rights reserved.
//

import UIKit
import SwifteriOS

final class Singleton {
    var tableArray: [Tweet] = []
    
    init() { }
    
    static let sharedInstance: Singleton = Singleton()

    func printArray() {
//        print("USER NAME -       \(tweets[0]["user"]["name"])")
//        print("USER SCREENNAME - \(tweets[0]["user"]["screen_name"])")
//        print("USER AVATAR -     \(tweets[0]["user"]["profile_image_url_https"])")
//        print("USER TIMESTAMP -  \(tweets[0]["user"]["created_at"])")
//        print("USER TWEET -      \(tweets[0]["text"])")
        
        print("ZALUPA")
        print(tableArray[0].avatarImgUrl)
        
    }
}
