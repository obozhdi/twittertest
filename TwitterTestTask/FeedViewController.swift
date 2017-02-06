//
//  FeedViewController.swift
//  TwitterTestTask
//
//  Created by obozhdi on 06/02/2017.
//  Copyright © 2017 obozhdi. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let textTweetHeight:  CGFloat = 150.0
    let imageTweetHeight: CGFloat = 310.0
    let textTweetReuseIdentifier:  String = "textTweetCell"
    let imageTweetReuseIdentifier: String = "imageTweetCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 42
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 != 0 {
            return 310
        }
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 != 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: imageTweetReuseIdentifier) as! ImageTweetCell
            
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: textTweetReuseIdentifier) as! TextTweetCell
        
        return cell
    }
    
}
