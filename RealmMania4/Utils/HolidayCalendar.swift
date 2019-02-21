//
//  HolidayCalendar.swift
//  DateMonster7
//
//  Created by Tom Bluewater on 11/23/16.
//  Copyright © 2016 Tom Bluewater. All rights reserved.
//

import Foundation

class HolidayCalendar {
    static func isHoliday(today: NSDate) -> Bool {
        let myCalendar = NSCalendar.init(calendarIdentifier:NSCalendar.Identifier.gregorian)! as NSCalendar
        let unitFlags: NSCalendar.Unit = [.year,.month,.day]
        let components = myCalendar.components(unitFlags,from:today as Date)
        let year = components.year
        let month = components.month
        let day = components.day
        if year == 2016 {
            if month == 1 {
                if day == 1 {
                    return true
                }
                else if day == 11 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 2 {
                if day == 11 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 3 {
                if day == 20 {
                    return true
                }
                else if day == 21 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 4 {
                if day == 29 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 5 {
                if day == 3 {
                    return true
                }
                else if day == 4 {
                    return true
                }
                else if day == 5 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 6 {
                return false
            }
            else if month == 7 {
                if day == 18 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 8 {
                if day == 11 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 9 {
                if day == 19 {
                    return true
                }
                else if day == 22 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 10 {
                if day == 10 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 11 {
                if day == 3 {
                    return true
                }
                else if day == 23 {
                    return true
                }
                else {
                    return false
                }
            }
            else {
                if day == 23 {
                    return true
                }
                else {
                    return false
                }
            }
        }
        else if year == 2017 {
            if month == 1 {
                if day == 1 {
                    return true
                }
                else if day == 2 {
                    return true
                }
                else if day == 9 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 2 {
                if day == 11 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 3 {
                if day == 20 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 4 {
                if day == 29 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 5 {
                if day == 3 {
                    return true
                }
                else if day == 4 {
                    return true
                }
                else if day == 5 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 6 {
                return false
            }
            else if month == 7 {
                if day == 17 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 8 {
                if day == 11 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 9 {
                if day == 18 {
                    return true
                }
                else if day == 23 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 10 {
                if day == 9 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 11 {
                if day == 3 {
                    return true
                }
                else if day == 23 {
                    return true
                }
                else {
                    return false
                }
            }
            else {
                if day == 23 {
                    return true
                }
                else {
                    return false
                }
            }
        }
        else if year == 2018 {
            if month == 1 {
                if day == 1 {
                    return true
                }
                else if day == 8 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 2 {
                if day == 11 {
                    return true
                }
                else if day == 12 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 3 {
                if day == 21 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 4 {
                if day == 29 {
                    return true
                }
                else if day == 30 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 5 {
                if day == 3 {
                    return true
                }
                else if day == 4 {
                    return true
                }
                else if day == 5 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 6 {
                return false
            }
            else if month == 7 {
                if day == 16 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 8 {
                if day == 11 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 9 {
                if day == 17 {
                    return true
                }
                else if day == 23 {
                    return true
                }
                else if day == 24 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 10 {
                if day == 8 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 11 {
                if day == 3 {
                    return true
                }
                else if day == 23 {
                    return true
                }
                else {
                    return false
                }
            }
            else {
                if day == 23 {
                    return true
                }
                else if day == 24 {
                    return true
                }
                else {
                    return false
                }
            }
        }
        else if year == 2019 {
            if month == 1 {
                if day == 1 {
                    return true
                }
                else if day == 14 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 2 {
                if day == 11 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 3 {
                if day == 21 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 4 {
                if day == 29 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 5 {
                if day == 3 {
                    return true
                }
                else if day == 4 {
                    return true
                }
                else if day == 5 {
                    return true
                }
                else if day == 6 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 6 {
                return false
            }
            else if month == 7 {
                if day == 15 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 8 {
                if day == 11 {
                    return true
                }
                else if day == 12 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 9 {
                if day == 16 {
                    return true
                }
                else if day == 23 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 10 {
                if day == 14 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 11 {
                if day == 3 {
                    return true
                }
                else if day == 4 {
                    return true
                }
                else if day == 23 {
                    return true
                }
                else {
                    return false
                }
            }
            else {
                if day == 23 {
                    return true
                }
                else {
                    return false
                }
            }
        }
        else if year == 2020 {
            if month == 1 {
                if day == 1 {
                    return true
                }
                else if day == 13 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 2 {
                if day == 11 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 3 {
                if day == 20 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 4 {
                if day == 29 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 5 {
                if day == 3 {
                    return true
                }
                else if day == 4 {
                    return true
                }
                else if day == 5 {
                    return true
                }
                else if day == 6 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 6 {
                return false
            }
            else if month == 7 {
                if day == 20 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 8 {
                if day == 11 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 9 {
                if day == 21 {
                    return true
                }
                else if day == 22 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 10 {
                if day == 12 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 11 {
                if day == 3 {
                    return true
                }
                else if day == 23 {
                    return true
                }
                else {
                    return false
                }
            }
            else {
                if day == 23 {
                    return true
                }
                else {
                    return false
                }
            }
        }
        
        return false
    }
    
    static func isHoliday2(year: Int, month: Int, day: Int) -> Bool {
        if year == 2016 {
            if month == 1 {
                if day == 1 {
                    return true
                }
                else if day == 11 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 2 {
                if day == 11 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 3 {
                if day == 20 {
                    return true
                }
                else if day == 21 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 4 {
                if day == 29 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 5 {
                if day == 3 {
                    return true
                }
                else if day == 4 {
                    return true
                }
                else if day == 5 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 6 {
                return false
            }
            else if month == 7 {
                if day == 18 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 8 {
                if day == 11 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 9 {
                if day == 19 {
                    return true
                }
                else if day == 22 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 10 {
                if day == 10 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 11 {
                if day == 3 {
                    return true
                }
                else if day == 23 {
                    return true
                }
                else {
                    return false
                }
            }
            else {
                if day == 23 {
                    return true
                }
                else {
                    return false
                }
            }
        }
        else if year == 2017 {
            if month == 1 {
                if day == 1 {
                    return true
                }
                else if day == 2 {
                    return true
                }
                else if day == 9 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 2 {
                if day == 11 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 3 {
                if day == 20 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 4 {
                if day == 29 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 5 {
                if day == 3 {
                    return true
                }
                else if day == 4 {
                    return true
                }
                else if day == 5 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 6 {
                return false
            }
            else if month == 7 {
                if day == 17 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 8 {
                if day == 11 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 9 {
                if day == 18 {
                    return true
                }
                else if day == 23 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 10 {
                if day == 9 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 11 {
                if day == 3 {
                    return true
                }
                else if day == 23 {
                    return true
                }
                else {
                    return false
                }
            }
            else {
                if day == 23 {
                    return true
                }
                else {
                    return false
                }
            }
        }
        else if year == 2018 {
            if month == 1 {
                if day == 1 {
                    return true
                }
                else if day == 8 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 2 {
                if day == 11 {
                    return true
                }
                else if day == 12 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 3 {
                if day == 21 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 4 {
                if day == 29 {
                    return true
                }
                else if day == 30 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 5 {
                if day == 3 {
                    return true
                }
                else if day == 4 {
                    return true
                }
                else if day == 5 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 6 {
                return false
            }
            else if month == 7 {
                if day == 16 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 8 {
                if day == 11 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 9 {
                if day == 17 {
                    return true
                }
                else if day == 23 {
                    return true
                }
                else if day == 24 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 10 {
                if day == 8 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 11 {
                if day == 3 {
                    return true
                }
                else if day == 23 {
                    return true
                }
                else {
                    return false
                }
            }
            else {
                if day == 23 {
                    return true
                }
                else if day == 24 {
                    return true
                }
                else {
                    return false
                }
            }
        }
        else if year == 2019 {
            if month == 1 {
                if day == 1 {
                    return true
                }
                else if day == 14 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 2 {
                if day == 11 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 3 {
                if day == 21 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 4 {
                if day == 29 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 5 {
                if day == 3 {
                    return true
                }
                else if day == 4 {
                    return true
                }
                else if day == 5 {
                    return true
                }
                else if day == 6 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 6 {
                return false
            }
            else if month == 7 {
                if day == 15 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 8 {
                if day == 11 {
                    return true
                }
                else if day == 12 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 9 {
                if day == 16 {
                    return true
                }
                else if day == 23 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 10 {
                if day == 14 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 11 {
                if day == 3 {
                    return true
                }
                else if day == 4 {
                    return true
                }
                else if day == 23 {
                    return true
                }
                else {
                    return false
                }
            }
            else {
                if day == 23 {
                    return true
                }
                else {
                    return false
                }
            }
        }
        else if year == 2020 {
            if month == 1 {
                if day == 1 {
                    return true
                }
                else if day == 13 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 2 {
                if day == 11 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 3 {
                if day == 20 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 4 {
                if day == 29 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 5 {
                if day == 3 {
                    return true
                }
                else if day == 4 {
                    return true
                }
                else if day == 5 {
                    return true
                }
                else if day == 6 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 6 {
                return false
            }
            else if month == 7 {
                if day == 20 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 8 {
                if day == 11 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 9 {
                if day == 21 {
                    return true
                }
                else if day == 22 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 10 {
                if day == 12 {
                    return true
                }
                else {
                    return false
                }
            }
            else if month == 11 {
                if day == 3 {
                    return true
                }
                else if day == 23 {
                    return true
                }
                else {
                    return false
                }
            }
            else {
                if day == 23 {
                    return true
                }
                else {
                    return false
                }
            }
        }
        
        return false
    }
    
    // It is conveniently used to create an NSDate object on the fly for a testing purpose
    static func make(yr: Int, mon: Int, day: Int) -> NSDate {
        if yr >= 1970 && yr < 2030 && mon > 0 && mon <= 12 && day > 0 && day <= 31 {
            let dateComponents = NSDateComponents()
            dateComponents.year = yr
            dateComponents.month = mon
            dateComponents.day = day
            let date = NSCalendar.current.date(from: dateComponents as DateComponents)
            return date! as NSDate
        } else {
            let dateComponents = NSDateComponents()
            dateComponents.year = 1900
            dateComponents.month = mon
            dateComponents.day = day
            let date = NSCalendar.current.date(from: dateComponents as DateComponents)
            return date! as NSDate
        }
    }
    
    static func isSaturday(today: NSDate) -> Bool {
        let num = NSCalendar.current.component(.weekday, from: today as Date)
        return (num == 7) ? true : false
    }
    
    static func isSunday(today: NSDate) -> Bool {
        let num = NSCalendar.current.component(.weekday, from: today as Date)
        return (num == 1) ? true : false
    }
}
