//
//  LoginViewController.swift
//  TwitterTestTask
//
//  Created by obozhdi on 06/02/2017.
//  Copyright © 2017 obozhdi. All rights reserved.
//

import UIKit
import Accounts
import Social
import SwifteriOS
import SafariServices

class LoginViewController: UIViewController, SFSafariViewControllerDelegate {
    
    var swifter: Swifter
    var tweets : [JSON] = []
    
    required init?(coder aDecoder: NSCoder) {
        self.swifter = Swifter(consumerKey: "RErEmzj7ijDkJr60ayE2gjSHT", consumerSecret: "SbS0CHk11oJdALARa7NDik0nty4pXvAxdt7aj0R5y1gNzWaNEx")
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func fetchTwitterHomeStream(completion: (() -> Void)?) {
        let failureHandler: (Error) -> Void = { error in
            self.alert(title: "Error", message: error.localizedDescription)
        }
        
        self.swifter.getHomeTimeline(count: 50, success: { json in
            
            guard let tweets = json.array else {
                completion?()
                
                return
            }
            
            var tweetsArray: [Tweet] = []
            
            for i in tweets {
                let tweetObject = Tweet.init(json: i)
                tweetsArray.append(tweetObject)
            }
            
            Singleton.sharedInstance.tableArray = tweetsArray
            Singleton.sharedInstance.printArray()
            completion?()
        }, failure: failureHandler)
        
    }
    
    @IBAction func getTweets(_ sender: Any) {
        let failureHandler: (Error) -> Void = { error in
            self.alert(title: "Error", message: error.localizedDescription)
        }
        
        let url = URL(string: "swifter://success")!
        
        swifter.authorize(with: url, presentFrom: self, success: { _ in
            self.fetchTwitterHomeStream(completion: { 
                self.performSegue(withIdentifier: "ShowTabbarController", sender: nil)
            })
        }, failure: failureHandler)
    }
    
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
