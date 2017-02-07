//
//  TwitterData.swift
//  TwitterTestTask
//
//  Created by obozhdi on 07/02/2017.
//  Copyright © 2017 obozhdi. All rights reserved.
//

import UIKit

class TwitterData {
    
    static let sharedInstance : TwitterData = {
        let instance = TwitterData()
        
        return instance
    }()
    
    var stringArray : [String] = ["MyString"]
    
    convenience init() {
        self.init(array : [])
    }
    
    init( array : [String]) {
        stringArray = array
    }

}
