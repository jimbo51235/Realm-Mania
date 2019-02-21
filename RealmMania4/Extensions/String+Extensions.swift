//
//  String+Extensions.swift
//  TokyoSubways
//
//  Created by Tom Bluewater on 11/22/16.
//  Copyright © 2016 Tom Bluewater. All rights reserved.
//

import Foundation

extension String {
    func isInt() -> Bool {
        if let _ = Int(self) {
            return true
        }
        else {
            return false
        }
    }
    
    func isPositiveInt() -> Bool {
        if let num = Int(self) {
            if num > 0 {
                return true
            } else {
                return false
            }
        }
        else {
            return false
        }
    }
    
    func isFloat() -> Bool {
        if let _ = Float(self) {
            return true
        }
        else {
            return false
        }
    }
    
    func isDouble() -> Bool {
        if let _ = Double(self) {
            return true
        }
        else {
            return false
        }
    }
    
    func isMacVersion() -> Bool {
        if let ver = Float(self) {
            if ver >= 10.7 {
                return true
            }
            else {
                return false
            }
        }
        else {
            return false
        }
    }
    
    func hasLineBreak() -> Bool {
        let strArray = self.components(separatedBy: CharacterSet.newlines)
        return (strArray.count <= 1) ? false : true
    }
    
    func getLeft(length: Int) -> String? {
        if length < 0 {
            return nil
        }
        else {
            if length <= self.count {
                let start = self.startIndex
                let end = self.index(self.endIndex, offsetBy: length - self.count) // going backwards from the end
                let substring = self[start..<end]
                return String(substring)
            } else {
                return nil
            }
        }
    }
    
    func getRight(length: Int) -> String? {
        if length < 0 {
            return nil
        }
        else {
            if length <= self.count {
                let start = self.index(self.startIndex, offsetBy: self.count - length)
                let end = self.endIndex
                let substring = self[start..<end]
                return String(substring)
            } else {
                return nil
            }
        }
    }
    
    func replaceAll(find: String, replace: String) -> String? {
        if self == "" {
            return nil
        } else {
            let str = self.replacingOccurrences(of: find, with: replace)
            return str
        }
    }
    
    func replaceAllWithArray(findArray: [String], str: String) -> String? {
        if findArray.count == 0 { return nil }
        else {
            var newStr = self
            for i in 0..<findArray.count {
                let search = findArray[i]
                newStr = newStr.replacingOccurrences(of: search, with: str)
            }
            return newStr
        }
    }
    
    func positionAt(position: Int) -> String? {
        // pisition of the first character is 0
        if position < 0 {
            return nil
        }
        else if position > self.count {
            return nil
        }
        else {
            if position <= self.count {
                let start = self.index(self.startIndex, offsetBy: position)
                let end = self.index(self.startIndex, offsetBy: position + 1)
                let subString = self[start..<end]
                return String(subString)
            } else {
                return nil
            }
        }
        /*
         let text = "0123456789"
         if let sub = text.positionAt(position: 5) {
         print(sub) // 5
         }
         */
    }
    
    func getOccurrences(find: String) -> Int {
        let occurrenceArray = self.components(separatedBy: find)
        return (occurrenceArray.count - 1)
    }
    
    func getFirstElement(separator: String) -> String? {
        if separator == "" {
            return nil
        }
        else {
            if self.count > 0 {
                let array = self.components(separatedBy: separator)
                if let first = array.first {
                    return first
                } else {
                    return nil
                }
            } else {
                return nil
            }
        }
    }
    
    func getLastElement(separator: String) -> String? {
        if separator == "" {
            return nil
        }
        else {
            if self.count > 0 {
                let array = self.components(separatedBy: separator)
                if let last = array.last {
                    return last
                } else {
                    return nil
                }
            } else {
                return nil
            }
        }
    }
    
    func isAlphabetLettersNumbersOnly() -> Bool {
        let letters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
        let allowedDharacterSet = NSCharacterSet.init(charactersIn: letters)
        let characterSet = CharacterSet(charactersIn: self)
        if allowedDharacterSet.isSuperset(of: characterSet) {
            return true
        } else {
            return false
        }
    }
    
    func isASCIIOnly() -> Bool {
        let letters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz !\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"
        let allowedDharacterSet = NSCharacterSet.init(charactersIn: letters)
        let characterSet = CharacterSet(charactersIn: self)
        if allowedDharacterSet.isSuperset(of: characterSet) {
            return true
        } else {
            return false
        }
    }
    
    func isStringValid(num: Int) -> Bool {
        if self.count >= num {
            let text = self.replacingOccurrences(of: " ", with: "")
            if text != "" {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    func isStringValid(num: Int, canHaveSpace: Bool) -> Bool {
        if self.count >= num {
            let text = self.replacingOccurrences(of: " ", with: "")
            if text != "" {
                if canHaveSpace {
                    return true
                }
                else {
                    let charset = CharacterSet(charactersIn: " ")
                    if self.rangeOfCharacter(from: charset) != nil {
                        return false
                    } else {
                        return true
                    }
                }
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    func hasCharacter(char: String) -> Bool {
        // case-insensitive //
        // REF: https;//stackoverflow.com/questions/28486138/what-is-the-best-way-to-determine-if-a-string-contains-a-character-from-a-set-in //
        if char == "" {
            return false
        } else {
            let charset = CharacterSet(charactersIn: char)
            if self.rangeOfCharacter(from: charset) != nil {
                return true
            } else {
                return false
            }
        }
    }
}

