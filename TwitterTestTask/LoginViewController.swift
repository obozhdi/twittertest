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
    
    var tweets : [JSON] = []
    
    @IBAction func getTweets(_ sender: Any) {
        let failureHandler: (Error) -> Void = { error in
            self.alert(title: "Error", message: error.localizedDescription)
        }
        
        TwitterManager.sharedInstance.auth(fromController: self, completion: {
            TwitterManager.sharedInstance.fetchTwitterHomeStream(givenSinceID: nil, givenMaxID: nil, completion: { (tweets) in
                
                if tweets.count > 0 {
                    Singleton.sharedInstance.sinceID = tweets.last?.tweetID
                }
                
                Singleton.sharedInstance.tableArray = tweets
                self.performSegue(withIdentifier: "ShowTabbarController", sender: nil)
            })
        }, failureHandler: failureHandler)
    }
    
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
