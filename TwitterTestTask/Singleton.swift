//
//  Sigleton.swift
//  TwitterTestTask
//
//  Created by obozhdi on 07/02/2017.
//  Copyright © 2017 obozhdi. All rights reserved.
//

import UIKit
import SwifteriOS

final class Singleton {
    var tableArray: [Tweet] = []
    
    init() { }
    
    static let sharedInstance: Singleton = Singleton()
}
