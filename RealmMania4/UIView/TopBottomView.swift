//
//  TopBottomView.swift
//  RealmMania3
//
//  Created by Kimberly on 2/20/18.
//  Copyright © 2018 Kimberly. All rights reserved.
//

import UIKit

class TopBottomView: UIView {
    override func draw(_ rect: CGRect) {
        let tHeight = self.frame.size.height
        let topLayer = CALayer()
        topLayer.frame = CGRect(x: 0.0, y: tHeight - 0.5, width: self.frame.size.width, height: 0.5)
        topLayer.backgroundColor = UIColor.black.cgColor
        topLayer.masksToBounds = true
        self.layer.addSublayer(topLayer)
        
        let bottomLayer = CALayer()
        bottomLayer.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: 0.5)
        bottomLayer.backgroundColor = UIColor.black.cgColor
        bottomLayer.masksToBounds = true
        self.layer.addSublayer(bottomLayer)
    }
}

