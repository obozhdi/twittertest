//
//  FeedViewController.swift
//  TwitterTestTask
//
//  Created by obozhdi on 06/02/2017.
//  Copyright © 2017 obozhdi. All rights reserved.
//

import UIKit

extension UIImageView {
    public func imageFromServerURL(urlString: String) {
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
            
        }).resume()
    }
}

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let textTweetHeight:  CGFloat = 150.0
    let imageTweetHeight: CGFloat = 310.0
    let textTweetReuseIdentifier:  String = "textTweetCell"
    let imageTweetReuseIdentifier: String = "imageTweetCell"
    @IBOutlet weak var tableView: UITableView!
    var refreshControl = UIRefreshControl()
    var isLoaded: Bool = false
    
    @IBOutlet weak var hideAvatarsBtn: UIButton!
    var avatarWidth: CGFloat = 50
    let defaults = UserDefaults.standard
    var avatarsOn: Bool?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "navbar_bg")
        self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        
        if !launchedBefore  {
            print("First launch, setting UserDefault.")
            avatarsOn = true
            UserDefaults.standard.set(avatarsOn, forKey: "onOff")
        } else {
            print("Not first launch.")
            avatarsOn = UserDefaults.standard.bool(forKey: "onOff")
            print(UserDefaults.standard.bool(forKey: "onOff"))
        }
        
        if UserDefaults.standard.bool(forKey: "onOff") == false {
            avatarWidth = 0
            self.hideAvatarsBtn.setTitle("Show", for: .normal)
        } else {
            avatarWidth = 50
            self.hideAvatarsBtn.setTitle("Hide", for: .normal)
        }
        
        UserDefaults.standard.set(true, forKey: "onOff")
        avatarsOn = UserDefaults.standard.bool(forKey: "onOff") as Bool!
        
        self.tableView.addSubview(refreshControl)
        
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    @IBAction func showHideAvatars(_ sender: Any) {
        if avatarsOn!{
            print("avatars off")
            avatarsOn = !avatarsOn!
            self.hideAvatarsBtn.setTitle("Show", for: .normal)
            self.avatarWidth = 0
            UserDefaults.standard.set(false, forKey: "onOff")
            print(UserDefaults.standard.bool(forKey: "onOff"))
        } else {
            print("avatars on")
            avatarsOn = !avatarsOn!
            self.hideAvatarsBtn.setTitle("Hide", for: .normal)
            self.avatarWidth = 50
            UserDefaults.standard.set(true, forKey: "onOff")
            print(UserDefaults.standard.bool(forKey: "onOff"))
        }
        self.tableView.reloadData()
    }
    
    
    func refreshData() {
        self.getData(givenSinceID: nil, givenMaxID: nil)
    }
    
    func getData(givenSinceID: String?, givenMaxID: String?) {
        TwitterManager.sharedInstance.fetchTwitterHomeStream(givenSinceID: givenSinceID, givenMaxID: givenMaxID, completion: { (tweets) in
            
            if givenSinceID == nil {
                Singleton.sharedInstance.tableArray = tweets
                self.isLoaded = false
            } else {
                Singleton.sharedInstance.tableArray += tweets
            }
            
            if tweets.count > 0 {
                Singleton.sharedInstance.sinceID = tweets.last?.tweetID
                
                DispatchQueue.main.async(execute: { () -> Void in
                    self.tableView.reloadData()
                    self.refreshControl.endRefreshing()
                })
            } else {
                self.isLoaded = true
            }
            
        })
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Singleton.sharedInstance.tableArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textTweetReuseIdentifier) as! TextTweetCell
        
        cell.avatarImgView.imageFromServerURL(urlString: Singleton.sharedInstance.tableArray[indexPath.row].avatarImgUrl!)
        cell.nameLabel.text = Singleton.sharedInstance.tableArray[indexPath.row].nameText
        cell.screennameLabel.text = Singleton.sharedInstance.tableArray[indexPath.row].screennameText
        cell.tweetTextLabel.text = Singleton.sharedInstance.tableArray[indexPath.row].tweetTextText
        cell.timestampLabel.text = Singleton.sharedInstance.tableArray[indexPath.row].timestampTextl
        cell.avatarWidthConstraint.constant = self.avatarWidth
        
//        if (indexPath.row == Singleton.sharedInstance.tableArray.count - 1) && !self.isLoaded {
//            self.isLoaded = true
//            self.getData(givenSinceID: nil, givenMaxID: Singleton.sharedInstance.sinceID)
//        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SingleTweet" {
            let nextVC = segue.destination as! TweetViewController
            nextVC.tweet = sender as? Tweet
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let passedTweet = Singleton.sharedInstance.tableArray[indexPath.row]
        performSegue(withIdentifier: "SingleTweet", sender: passedTweet)
    }
    
}
