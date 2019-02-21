//
//  Currency.swift
//  DateMonster
//
//  Created by Kimberly on 2/7/18.
//  Copyright © 2018 Kimberly. All rights reserved.
//

import Foundation

class Currency {
    static func getLocalCurrencyName() -> String {
        let locale = Locale.current
        let currencyCode = locale.currencyCode!
        return currencyCode
    }
    
    static func getLocalCurrencySymbol() -> String {
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        return currencySymbol
    }
}

