//
//  FileManager.swift
//  AllNews
//
//  Created by Tom Bluewater on 1/29/17.
//  Copyright © 2017 Tom Bluewater. All rights reserved.
//

import Foundation

class FileHandler {
    static func createFolder(path:String) -> () {
        do {
            try FileManager.default.createDirectory(atPath: path,withIntermediateDirectories:false,attributes:nil)
        } catch let error as NSError {
            print(error.localizedDescription);
        }
    }
    
    static func pathExists(path:String) -> Bool {
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: path) {
            return true
        } else {
            return false
        }
    }
    
    static func pathDelete(path:String) -> Void {
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: path) {
            do {
                try fileManager.removeItem(atPath: path)
            }
            catch let error as NSError {
                print("Failing to delete the file: \(error)")
            }
        }
    }
    
    static func copyFile2(sourcePath:String,destFile:String) -> Void {
        let fileManager = FileManager.default
        do {
            try fileManager.copyItem(atPath: sourcePath,toPath:destFile)
        }
        catch let error as NSError {
            print("Failing to copying the file: \(error)")
        }
    }
}

