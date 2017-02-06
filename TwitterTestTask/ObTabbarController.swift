//
//  ObTabbarController.swift
//  TwitterTestTask
//
//  Created by obozhdi on 06/02/2017.
//  Copyright © 2017 obozhdi. All rights reserved.
//

import UIKit

class ObTabbarController: UITabBarController {
    let tabbarWidth: CGFloat = UIScreen.main.bounds.size.width
    let tabbarYPos:  CGFloat = UIScreen.main.bounds.size.height - 49

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var myImage = UIImage(named: "tabbar_bg")
        let myInsets : UIEdgeInsets = UIEdgeInsets.zero
        myImage = myImage?.resizableImage(withCapInsets: myInsets)

        UITabBar.appearance().backgroundColor = UIColor(patternImage: myImage!)
    }
}
