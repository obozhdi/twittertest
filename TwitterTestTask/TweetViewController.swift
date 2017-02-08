//
//  TweetViewController.swift
//  TwitterTestTask
//
//  Created by obozhdi on 06/02/2017.
//  Copyright © 2017 obozhdi. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {
    
    @IBOutlet weak var avatarImgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screennameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    
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
