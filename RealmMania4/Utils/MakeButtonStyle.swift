//
//  BasicRoundButton.swift
//  MeOvertime
//
//  Created by Kimberly on 1/29/18.
//  Copyright © 2018 Tom Bluewater. All rights reserved.
//

import UIKit

class MakeButtonStyle {
    static func defaultButtonStyle(button: UIButton, title: String) {
        button.tintColor = UIColor.orange
        button.setTitle(title, for: .normal)
        button.layer.borderColor = UIColor.init(red: 6/255.0, green: 170/255.0, blue: 212/255.0, alpha: 1.0).cgColor
        button.layer.cornerRadius = 10.0
        button.layer.borderWidth = 1.0
        button.layer.backgroundColor = UIColor.white.cgColor
    }
}

