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
    
    static let dateFormatter = DateFormatter()
    static let dateFormatterFinal = DateFormatter()

    init(json: JSON) {
        super.init()
        
        self.avatarImgUrl = json["user"]["profile_image_url_https"].string
        self.nameText = json["user"]["name"].string
        self.screennameText = "@" + json["user"]["screen_name"].string!
        
        let dateString = json["created_at"].string
        
        Tweet.dateFormatter.dateFormat = "EEE MMM dd HH:mm:ss ZZZ yyyy"
        Tweet.dateFormatter.locale = Locale.init(identifier: "en_GB")
        Tweet.dateFormatter.timeZone = TimeZone.init(secondsFromGMT: 0)
        
        let dateObj = Tweet.dateFormatter.date(from: dateString!)
        
        Tweet.dateFormatterFinal.dateFormat = "hh:mm dd-MM-yyyy"
        
        self.timestampTextl = Tweet.dateFormatterFinal.string(from: dateObj!)
        self.tweetTextText = json["text"].string
        self.tweetImageUrl = "tweetImageUrl"
    }
}
