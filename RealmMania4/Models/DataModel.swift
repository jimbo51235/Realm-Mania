//
//  Model.swift
//  RealmMania3
//
//  Created by Kimberly on 2/20/18.
//  Copyright © 2018 Kimberly. All rights reserved.
//

import Foundation
import RealmSwift

class Profile: Object {
    @objc dynamic var firstName = ""
    @objc dynamic var lastName = ""
    @objc dynamic var gender = false
    @objc dynamic var age = 0
    @objc dynamic var picture: Data? = nil
}

// if you set a property name to first or last, NSPredicate will fail because those names are reserved. //

