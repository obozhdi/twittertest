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
    
    var swifter = Swifter(consumerKey: "nxJuCvaI8TgusEMBEWkMza3i1", consumerSecret: "nLStckpxQjeAqb2AB7EKF1Hye7RM7M5AGUgdbiBUgvkbAR0dqC")
    
    func auth(fromController: UIViewController, completion: @escaping (() -> Void), failureHandler: @escaping ((Error) -> Void)) {
        let url = URL(string: "tweettestapp://success")!
        
        swifter.authorize(with: url, presentFrom: fromController, success: { _ in
            completion()
        }, failure: failureHandler)
    }
    
    func fetchTwitterHomeStream(givenSinceID: String?, givenMaxID: String?, completion: (([Tweet]) -> Void)?) {
        let failureHandler: (Error) -> Void = { error in
            print(error)
        }
        
        self.swifter.getHomeTimeline(count: 10, sinceID: givenSinceID, maxID: givenMaxID, success: { json in
//            print(json)
            
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
