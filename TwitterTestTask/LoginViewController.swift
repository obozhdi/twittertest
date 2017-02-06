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
    
    var swifter: Swifter?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.swifter = Swifter(consumerKey: "nxJuCvaI8TgusEMBEWkMza3i1", consumerSecret: "nLStckpxQjeAqb2AB7EKF1Hye7RM7M5AGUgdbiBUgvkbAR0dqC")

        let url = URL(string: "tweettestapp://success")!
        
        swifter?.authorize(with: url, presentFrom: self, success: { _ in
            print("good")
        }, failure: nil)
        
        swifter?.getHomeTimeline(count: 50, success: { json in
            print(json)
        }, failure: { error in
            print(error)
        })

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
    
//    -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//    {
//    [self.view endEditing:YES];
//    }
}
