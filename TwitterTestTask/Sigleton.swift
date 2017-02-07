//
//  Sigleton.swift
//  TwitterTestTask
//
//  Created by obozhdi on 07/02/2017.
//  Copyright © 2017 obozhdi. All rights reserved.
//

import UIKit
import SwifteriOS

class Sigleton: NSObject {
    var tweets : [JSON] = []
    
    override init() {
        super.init()
        
    }

    func printArray() {
        print("USER NAME -       \(tweets[0]["user"]["name"])")
        print("USER SCREENNAME - \(tweets[0]["user"]["screen_name"])")
        print("USER AVATAR -     \(tweets[0]["user"]["profile_image_url_https"])")
        print("USER TIMESTAMP -  \(tweets[0]["user"]["created_at"])")
        print("USER TWEET -      \(tweets[0]["text"])")
        
        
        print(tweets[0])
    }
}
