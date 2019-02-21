//
//  Time.swift
//  TokyoSubways
//
//  Created by Tom Bluewater on 12/25/16.
//  Copyright © 2016 Tom Bluewater. All rights reserved.
//

import Foundation

class Timedate {
    static func totalSeconds() -> Int {
        let calendar: NSCalendar =  NSCalendar(identifier: NSCalendar.Identifier.gregorian)!
        let dateComponets = calendar.components([NSCalendar.Unit.day, NSCalendar.Unit.month, NSCalendar.Unit.year, NSCalendar.Unit.weekOfYear, NSCalendar.Unit.hour, NSCalendar.Unit.minute, NSCalendar.Unit.second, NSCalendar.Unit.nanosecond], from: NSDate() as Date)
        let newDate = calendar.date(from: dateComponets)
        let timeStamp = Int(newDate!.timeIntervalSince1970)
        return timeStamp
    }
    
    static func convertDateTotalsecs(date: NSDate) -> Int {
        let calendar: NSCalendar =  NSCalendar(identifier: NSCalendar.Identifier.gregorian)!
        let dateComponents = calendar.components([NSCalendar.Unit.day, NSCalendar.Unit.month, NSCalendar.Unit.year, NSCalendar.Unit.weekOfYear, NSCalendar.Unit.hour, NSCalendar.Unit.minute, NSCalendar.Unit.second, NSCalendar.Unit.nanosecond], from: date as Date)
        let newDate = calendar.date(from: dateComponents)
        let timeStamp = Int(newDate!.timeIntervalSince1970)
        return timeStamp
    }
    
    static func convertSecsToDate(secs: Int) -> Date {
        let secs = Double(secs)
        let date = Date(timeIntervalSince1970: secs)
        let calendar = NSCalendar(identifier:NSCalendar.Identifier.gregorian)!
        let myTime = calendar.components([NSCalendar.Unit.day, NSCalendar.Unit.month, NSCalendar.Unit.year, NSCalendar.Unit.weekOfYear, NSCalendar.Unit.hour, NSCalendar.Unit.minute, NSCalendar.Unit.second, NSCalendar.Unit.nanosecond], from: date)
        return Calendar.current.date(from: myTime)!
    }
    
    static func convertTsecsToDate(tsecs: String) -> Date {
        let dSecs = Double(tsecs)
        let date = Date(timeIntervalSince1970: dSecs!)
        let calendar = NSCalendar(identifier:NSCalendar.Identifier.gregorian)!
        let myTime = calendar.components([NSCalendar.Unit.day, NSCalendar.Unit.month, NSCalendar.Unit.year, NSCalendar.Unit.weekOfYear, NSCalendar.Unit.hour, NSCalendar.Unit.minute, NSCalendar.Unit.second, NSCalendar.Unit.nanosecond], from: date)
        return Calendar.current.date(from: myTime)!
    }
    
    static func makeDate(year: Int, month: Int, day: Int, hr: Int, min: Int, sec: Int) -> Date {
        // according to GMT //
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)! // <<<<<<<<<<<<<<<<<<<
        let components = DateComponents(year: year, month: month, day: day, hour: hr, minute: min, second: sec)
        return calendar.date(from: components)!
    }
    
    static func makeDate2(year: Int, month: Int, day: Int, hr: Int, min: Int, sec: Int) -> Date {
        // according to system clock //
        // REF: https///stackoverflow.com/questions/39341941/type-timezone-has-no-member-local-in-swift3 //
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone.ReferenceType.system // <<<<<<<<<<<<<<<<<<<
        let components = DateComponents(year: year, month: month, day: day, hour: hr, minute: min, second: sec)
        return calendar.date(from: components)!
    }
    
    static func makeDate3(year: Int, month: Int, day: Int, hr: Int, min: Int, sec: Int) -> Date {
        // according to local time zone //
        // REF: https///stackoverflow.com/questions/39341941/type-timezone-has-no-member-local-in-swift3 //
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone.ReferenceType.local // <<<<<<<<<<<<<<<<<<<
        let components = DateComponents(year: year, month: month, day: day, hour: hr, minute: min, second: sec)
        return calendar.date(from: components)!
    }
    
    static func isDayLight(year: Int, month: Int, day: Int, hr: Int, min: Int, sec: Int, tz: String) -> Bool {
        let components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        components.minute = min
        components.second = sec
        let calendar = NSCalendar(identifier:NSCalendar.Identifier.gregorian)!
        let myZone = NSTimeZone(name: tz)
        calendar.timeZone = myZone! as TimeZone
        return (myZone?.isDaylightSavingTime)!
    }
    
    static func makeWeekDays() -> [String] {
        let lan = NSLocale.preferredLanguages[0] as String
        let myLan = lan.components(separatedBy: "-").first! as String
        
        var weekDayArray = [String]()
        for language in NSLocale.isoLanguageCodes {
            if language == myLan {
                let df = DateFormatter()
                df.locale = NSLocale.init(localeIdentifier: language) as Locale!
                for weekday in df.weekdaySymbols {
                    weekDayArray.append(weekday)
                }
                return weekDayArray
            }
        }
        return ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    }
    
    static func getWeekdaySatSun() -> Int {
        // 0: weekday, 1: sat, 2: sun: 3: holiday
        // REF: https///stackoverflow.com/questions/25533147/get-day-of-week-using-nsdate
        let today = Date()
        if HolidayCalendar.isHoliday(today: today as NSDate) {
            return 3
        } else {
            if let dayInt = Calendar.current.dateComponents([.weekday], from: today).weekday {
                if dayInt == 1 {
                    return 2
                }
                else if dayInt == 7 {
                    return 1
                }
                else {
                    return 0
                }
            }
            else {
                return 0
            }
        }
    }

    static func currentMonthNumberDays() -> Int? {
        let now = Date()
        let calendar = NSCalendar.current
        let range = calendar.range(of: .day, in: .month, for: now)
        if let num = range?.count {
            return num
        } else {
            return nil
        }
    }
    
    static func anyMonthNumberDays(day: Date) -> Int? {
        let calendar = NSCalendar.current
        let range = calendar.range(of: .day, in: .month, for: day)
        if let num = range?.count {
            return num
        } else {
            return nil
        }
    }
    
    static func getLocalMonthLiteral() -> String {
        let lan = NSLocale.preferredLanguages[0] as String // Example: ja-JP (ja is the language, JP is the region)
        let now = NSDate() as Date
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: lan) as Locale!
        dateFormatter.dateFormat = "MMMM"  // use "MMM" for short names
        let monthString = dateFormatter.string(from: now)
        return monthString
    }
    
    static func getAnyLocalMonthLiteral(lan: String) -> String {
        let now = NSDate() as Date
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: lan) as Locale!
        dateFormatter.dateFormat = "MMMM"  // use "MMM" for short names
        let monthString = dateFormatter.string(from: now)
        return monthString
    }

    static func makeTodayStartGMT() -> Date? {
        // if current time is 2018-02-07 10:23:40 +0000, it will return 2018-02-07 00:00:00 +0000 //
        let now = Date()
        var cal = Calendar(identifier: .gregorian)
        cal.timeZone = TimeZone(secondsFromGMT: 0)!
        let year = cal.component(.year, from: now)
        let month = cal.component(.month, from: now)
        let day = cal.component(.day, from: now)
        let components = DateComponents(year: year, month: month, day: day, hour: 0, minute: 0, second: 0)
        return cal.date(from: components)
    }
    
    static func makeTodayEndGMT() -> Date? {
        // if current time is 2018-02-07 10:23:40 +0000, it will return 2018-02-07 23:59:59 +0000 //
        let now = Date()
        var cal = Calendar(identifier: .gregorian)
        cal.timeZone = TimeZone(secondsFromGMT: 0)!
        let year = cal.component(.year, from: now)
        let month = cal.component(.month, from: now)
        let day = cal.component(.day, from: now)
        let components = DateComponents(year: year, month: month, day: day, hour: 23, minute: 59, second: 59)
        return cal.date(from: components)
    }
    
    static func makeSystemTimeString(date: Date, index: Int) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone.system // <<<<<<<<<
        if index == 0 {
            formatter.dateFormat = "YYYY-MM-dd HH:mm"
        }
        else if index == 1 {
            formatter.dateFormat = "YY-MM-dd HH:mm"
        }
        else if index == 2 {
            formatter.dateFormat = "MM-dd-YYYY HH:mm"
        }
        else if index == 3 {
            formatter.dateFormat = "MM-dd-YY HH:mm"
        }
        else if index == 4 {
            formatter.dateFormat = "dd-MM-YYYY HH:mm"
        }
        else if index == 5 {
            formatter.dateFormat = "dd-MM-YY HH:mm"
        }
        else if index == 6 {
            formatter.dateFormat = "YYYY-MM-dd"
        }
        return formatter.string(from: date)
    }
}

