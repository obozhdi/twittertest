//
//  LoginViewController.swift
//  TwitterTestTask
//
//  Created by obozhdi on 06/02/2017.
//  Copyright © 2017 obozhdi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var twitterNameField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

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
