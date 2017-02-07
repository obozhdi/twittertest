//
//  Tweet.swift
//  TwitterTestTask
//
//  Created by obozhdi on 07/02/2017.
//  Copyright © 2017 obozhdi. All rights reserved.
//

import UIKit
import SwifteriOS

class Tweet: NSObject {
    var avatarImgUrl: String?
    var nameText: String?
    var screennameText: String?
    var timestampTextl: String?
    var tweetTextText: String?
    var tweetImageUrl: String?
    
    init(json: JSON) {
        super.init()
        
        self.avatarImgUrl = json["user"]["profile_image_url_https"].string
        self.nameText = json["user"]["name"].string
        
//        print("USER NAME -       \(tweets[0]["user"]["name"])")
    }
}
