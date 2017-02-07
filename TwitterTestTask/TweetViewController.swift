//
//  TweetViewController.swift
//  TwitterTestTask
//
//  Created by obozhdi on 06/02/2017.
//  Copyright © 2017 obozhdi. All rights reserved.
//

import UIKit

//extension UIImageView {
//    public func imageFromServerURL(urlString: String) {
//        
//        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
//            
//            if error != nil {
//                print(error!)
//                return
//            }
//            DispatchQueue.main.async(execute: { () -> Void in
//                let image = UIImage(data: data!)
//                self.image = image
//            })
//            
//        }).resume()
//    }
//}

class TweetViewController: UIViewController {
    
    @IBOutlet weak var avatarImgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screennameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var tweetImageView: UIImageView!
    
    var tweet: Tweet? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        
        self.avatarImgView.imageFromServerURL(urlString: (tweet?.avatarImgUrl)!)
        self.nameLabel.text = tweet?.nameText
        self.screennameLabel.text = tweet?.screennameText
        self.timestampLabel.text = tweet?.timestampTextl
        self.tweetTextLabel.text = tweet?.tweetTextText
    }
}
