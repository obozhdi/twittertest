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
    var singletonClass = Sigleton()
    
    required init?(coder aDecoder: NSCoder) {
        self.swifter = Swifter(consumerKey: "RErEmzj7ijDkJr60ayE2gjSHT", consumerSecret: "SbS0CHk11oJdALARa7NDik0nty4pXvAxdt7aj0R5y1gNzWaNEx")
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func fetchTwitterHomeStream() {
        let failureHandler: (Error) -> Void = { error in
            self.alert(title: "Error", message: error.localizedDescription)
        }
        
        self.swifter.getHomeTimeline(count: 5, success: { json in
            
            guard let tweets = json.array else { return }
            self.singletonClass.tweets = tweets
            
            self.singletonClass.printArray()
        }, failure: failureHandler)
        
    }
    
    @IBAction func getTweets(_ sender: Any) {
        let failureHandler: (Error) -> Void = { error in
            self.alert(title: "Error", message: error.localizedDescription)
            
        }
        
        let url = URL(string: "swifter://success")!
        
        swifter.authorize(with: url, presentFrom: self, success: { _ in
            self.fetchTwitterHomeStream()
        }, failure: failureHandler)
    }
    
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
