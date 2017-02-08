//
//  TwitterManager.swift
//  TwitterTestTask
//
//  Created by obozhdi on 08/02/2017.
//  Copyright © 2017 obozhdi. All rights reserved.
//

import UIKit
import Accounts
import Social
import SwifteriOS
import SafariServices

final class TwitterManager: NSObject {
    
    static let sharedInstance: TwitterManager = TwitterManager()
    
    var swifter: Swifter?
    
    override init() {
        super.init()
        self.swifter = Swifter(consumerKey: "RErEmzj7ijDkJr60ayE2gjSHT", consumerSecret: "SbS0CHk11oJdALARa7NDik0nty4pXvAxdt7aj0R5y1gNzWaNEx")
    }
    
    func auth(fromController: UIViewController, completion: @escaping (() -> Void), failureHandler: @escaping ((Error) -> Void)) {
        let url = URL(string: "swifter://success")!
        
        swifter?.authorize(with: url, presentFrom: fromController, success: { _ in
            completion()
        }, failure: failureHandler)
    }
    
    func fetchTwitterHomeStream(completion: (([Tweet]) -> Void)?) {
        let failureHandler: (Error) -> Void = { error in
            print(error)
        }
        
        self.swifter?.getHomeTimeline(count: 50, success: { json in
            print(json)
            
            guard let tweets = json.array else {
                completion?([])
                
                return
            }
            
            var tweetsArray: [Tweet] = []
            
            for i in tweets {
                let tweetObject = Tweet.init(json: i)
                tweetsArray.append(tweetObject)
            }
            
            completion?(tweetsArray)
        }, failure: failureHandler)
    }

}
