//
//  Random.swift
//  FontsView 4
//
//  Created by Kimberly on 2017/08/18.
//  Copyright © 2017 Tom Bluewater. All rights reserved.
//

import Foundation

class Random {
    static func genRandom(endNumber: Int, b: Bool) -> Int {
        // b = true -> includes 0
        if b {
            let n = UInt32(endNumber + 1)
            let number = Int(arc4random_uniform(n))
            return number
        } else {
            let n = UInt32(endNumber)
            let number = Int(arc4random_uniform(n))
            return number + 1
        }
    }
    
    static func randRange (lower: Int , upper: Int) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
}

