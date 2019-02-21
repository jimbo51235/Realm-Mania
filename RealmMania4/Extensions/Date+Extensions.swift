//
//  Date+Extensions.swift
//  Coupon Producer
//
//  Created by Kimberly on 2/4/18.
//  Copyright © 2018 Tom Bluewater. All rights reserved.
//

import Foundation

extension Date {
    static func getLocalYearNow() -> Int {
        let now = Date()
        let cal = Calendar.current
        return cal.component(.year, from: now)
    }
    
    static func getLocalMonthNow() -> Int {
        let now = Date()
        let cal = Calendar.current
        return cal.component(.month, from: now)
    }
    
    static func getLocalDayNow() -> Int {
        let now = Date()
        let cal = Calendar.current
        return cal.component(.day, from: now)
    }
    
    static func getLocalHourNow() -> Int {
        let now = Date()
        let cal = Calendar.current
        return cal.component(.hour, from: now)
    }
    
    static func getLocalMinuteNow() -> Int {
        let now = Date()
        let cal = Calendar.current
        return cal.component(.minute, from: now)
    }
    
    static func getLocalSecondNow() -> Int {
        let now = Date()
        let cal = Calendar.current
        return cal.component(.second, from: now)
    }
    
    static func getGMTYearNow() -> Int {
        let now = Date()
        var cal = Calendar(identifier: .gregorian)
        cal.timeZone = TimeZone(secondsFromGMT: 0)!
        return cal.component(.year, from: now)
    }
    
    static func getGMTMonthNow() -> Int {
        let now = Date()
        var cal = Calendar(identifier: .gregorian)
        cal.timeZone = TimeZone(secondsFromGMT: 0)!
        return cal.component(.month, from: now)
    }
    
    static func getGMTDayNow() -> Int {
        let now = Date()
        var cal = Calendar(identifier: .gregorian)
        cal.timeZone = TimeZone(secondsFromGMT: 0)!
        return cal.component(.day, from: now)
    }
    
    static func getGMTHourNow() -> Int {
        let now = Date()
        var cal = Calendar(identifier: .gregorian)
        cal.timeZone = TimeZone(secondsFromGMT: 0)!
        return cal.component(.hour, from: now)
    }
    
    static func getGMTMinuteNow() -> Int {
        let now = Date()
        var cal = Calendar(identifier: .gregorian)
        cal.timeZone = TimeZone(secondsFromGMT: 0)!
        return cal.component(.minute, from: now)
    }
    
    static func getGMTSecondNow() -> Int {
        let now = Date()
        var cal = Calendar(identifier: .gregorian)
        cal.timeZone = TimeZone(secondsFromGMT: 0)!
        return cal.component(.second, from: now)
    }
    
    static func getGMTYear(date: Date) -> Int {
        var cal = Calendar(identifier: .gregorian)
        cal.timeZone = TimeZone(secondsFromGMT: 0)!
        return cal.component(.year, from: date)
    }
    static func getGMTMonth(date: Date) -> Int {
        var cal = Calendar(identifier: .gregorian)
        cal.timeZone = TimeZone(secondsFromGMT: 0)!
        return cal.component(.month, from: date)
    }
    static func getGMTDay(date: Date) -> Int {
        var cal = Calendar(identifier: .gregorian)
        cal.timeZone = TimeZone(secondsFromGMT: 0)!
        return cal.component(.day, from: date)
    }
    static func getGMTHour(date: Date) -> Int {
        var cal = Calendar(identifier: .gregorian)
        cal.timeZone = TimeZone(secondsFromGMT: 0)!
        return cal.component(.hour, from: date)
    }
    static func getGMTMinute(date: Date) -> Int {
        var cal = Calendar(identifier: .gregorian)
        cal.timeZone = TimeZone(secondsFromGMT: 0)!
        return cal.component(.minute, from: date)
    }
    static func getGMTSecond(date: Date) -> Int {
        var cal = Calendar(identifier: .gregorian)
        cal.timeZone = TimeZone(secondsFromGMT: 0)!
        return cal.component(.second, from: date)
    }
}
