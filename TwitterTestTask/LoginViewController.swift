//
//  LoginViewController.swift
//  TwitterTestTask
//
//  Created by obozhdi on 06/02/2017.
//  Copyright © 2017 obozhdi. All rights reserved.
//

import UIKit
import SwifteriOS
import Accounts

class LoginViewController: UIViewController {
    
    @IBOutlet weak var twitterNameField: UITextField!
    
    dynamic var tweets: [Tweet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swifter = Swifter(consumerKey: "nxJuCvaI8TgusEMBEWkMza3i1",
                              consumerSecret: "nLStckpxQjeAqb2AB7EKF1Hye7RM7M5AGUgdbiBUgvkbAR0dqC")
        
        swifter.authorize(with: URL(string: "swifter://success")!, presentFrom: self, success: { _ in
            
            swifter.getHomeTimeline(count: 1, success: { statuses in
                print("FUCKING DATA!!!!! \(statuses.array)")
            }, failure: nil)
        }, failure: nil)
        print(2)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.twitterNameField.resignFirstResponder()
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func getTweets(_ sender: Any) {
    }
}
