//
//  Sigleton.swift
//  TwitterTestTask
//
//  Created by obozhdi on 07/02/2017.
//  Copyright © 2017 obozhdi. All rights reserved.
//

import UIKit
import SwifteriOS

final class TweetStorage {
    var tableArray: [Tweet] = []
    var sinceID: String?
    var maxID: String?
    
    init() {}
    
    static let sharedInstance: TweetStorage = TweetStorage()
}
