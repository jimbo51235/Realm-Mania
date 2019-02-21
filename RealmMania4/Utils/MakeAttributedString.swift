//
//  MakeAttributedString.swift
//  AllNews Desktop
//
//  Created by Kimberly on 2017/06/11.
//  Copyright © 2017 Tom Bluewater. All rights reserved.
//

import Foundation
import UIKit

class MakeAttributedString {
    static func makeRegularAttributedString(text: String, fsize: CGFloat, color: UIColor) -> NSAttributedString {
        let atext = NSMutableAttributedString(string: text)
        let font = UIFont.systemFont(ofSize: fsize)
        let range = NSMakeRange(0, text.count)
        atext.addAttributes([NSAttributedStringKey.font:font], range: range)
        atext.addAttributes([NSAttributedStringKey.foregroundColor: color], range: range)
        return atext
    }
    
    static func makeShadowRegularAttributedString(text: String, fsize: CGFloat, color: UIColor, shadowColor: UIColor, shadowRadius: CGFloat) -> NSAttributedString {
        let shadow = NSShadow()
        shadow.shadowColor = shadowColor
        shadow.shadowOffset = CGSize.zero
        shadow.shadowBlurRadius = shadowRadius
        
        let atext = NSMutableAttributedString(string: text)
        let font = UIFont.systemFont(ofSize: fsize)
        let range = NSMakeRange(0, text.count)
        atext.addAttributes([NSAttributedStringKey.font:font], range: range)
        atext.addAttributes([NSAttributedStringKey.foregroundColor: color], range: range)
        atext.addAttributes([NSAttributedStringKey.shadow: shadow], range: range)
        return atext
    }
    
    static func makeSimpleAttributedString(text: String, fname: String, fsize: CGFloat, color: UIColor) -> NSAttributedString {
        let atext = NSMutableAttributedString(string: text)
        let font = UIFont(name: fname, size: fsize)
        //let font = UIFont.systemFontOfSize(fsize)
        let range = NSMakeRange(0, text.count)
        atext.addAttributes([NSAttributedStringKey.font: font!], range: range)
        atext.addAttributes([NSAttributedStringKey.foregroundColor: color], range: range)
        return atext
    }
    
    static func makeAlignmentAttributedString(text: String, fname: String, fsize: CGFloat, alignIndex: Int, color: UIColor) -> NSAttributedString {
        let atext = NSMutableAttributedString(string: text)
        let font = UIFont(name: fname, size: fsize)
        let pStyle = NSMutableParagraphStyle()
        pStyle.lineSpacing = 3.2
        if alignIndex == 0 { pStyle.alignment = .left }
        else if alignIndex == 1 { pStyle.alignment = .center }
        else if alignIndex == 2 { pStyle.alignment = .right }
        else if alignIndex == 3 { pStyle.alignment = .justified }
        let range = NSMakeRange(0, text.count)
        atext.addAttributes([NSAttributedStringKey.font:font!], range: range)
        atext.addAttributes([NSAttributedStringKey.foregroundColor: color], range: range)
        atext.addAttributes([NSAttributedStringKey.paragraphStyle: pStyle], range: range)
        return atext
    }
    
    static func makeRegularCenterAttributedString(text: String, fsize: CGFloat, color: UIColor) -> NSAttributedString {
        let atext = NSMutableAttributedString(string: text)
        let font = UIFont.systemFont(ofSize: fsize)
        let range = NSMakeRange(0, text.count)
        let pStyle = NSMutableParagraphStyle()
        pStyle.alignment = NSTextAlignment.center
        atext.addAttributes([NSAttributedStringKey.font: font], range: range)
        atext.addAttributes([NSAttributedStringKey.foregroundColor: color], range: range)
        atext.addAttributes([NSAttributedStringKey.paragraphStyle: pStyle], range: range)
        return atext
    }
    
    static func makeStrokeRegularAttributedString(text: String, fsize: CGFloat, color: UIColor, strokeColor: UIColor, strokeWidth: CGFloat) -> NSAttributedString {
        let atext = NSMutableAttributedString(string: text)
        let font = UIFont.systemFont(ofSize: fsize)
        let range = NSMakeRange(0, text.count)
        atext.addAttributes([NSAttributedStringKey.font:font], range: range)
        atext.addAttributes([NSAttributedStringKey.foregroundColor: color], range: range)
        atext.addAttributes([NSAttributedStringKey.strokeColor: strokeColor], range: range)
        atext.addAttributes([NSAttributedStringKey.strokeWidth: strokeWidth], range: range)
        return atext
    }
    /*
    static func makeTypeFaceAttributedString(text: String, fontName: String, faceName: String, fsize: CGFloat, color: UIColor) -> NSAttributedString {
        let atext = NSMutableAttributedString(string: text)
        let range = NSMakeRange(0, text.count)
        let font = NSFont(name: fontName, size: fsize)!
        let newFont = NSFontManager.shared.convert(font, toFace: faceName)!
        atext.addAttributes([NSAttributedStringKey.font: newFont], range: range)
        atext.addAttributes([NSAttributedStringKey.foregroundColor: color], range: range)
        return atext
    }
    */
    static func makeAttributedStringWithFont(text: String, font: UIFont, color: UIColor) -> NSAttributedString {
        let atext = NSMutableAttributedString(string: text)
        let range = NSMakeRange(0, text.count)
        atext.addAttributes([NSAttributedStringKey.font: font], range: range)
        atext.addAttributes([NSAttributedStringKey.foregroundColor: color], range: range)
        return atext
    }
    
    /*
    static func makeAlignmentAttributedStringWithFont(text: String, font: NSFont, alignIndex: Int, color: UIColor) -> NSAttributedString {
        let atext = NSMutableAttributedString(string: text)
        let pStyle = NSMutableParagraphStyle()
        if alignIndex == 0 { pStyle.alignment = .left }
        else if alignIndex == 1 { pStyle.alignment = .center }
        else if alignIndex == 2 { pStyle.alignment = .right }
        else if alignIndex == 3 { pStyle.alignment = .justified }
        let range = NSMakeRange(0, text.count)
        atext.addAttributes([NSAttributedStringKey.font: font], range: range)
        atext.addAttributes([NSAttributedStringKey.foregroundColor: color], range: range)
        atext.addAttributes([NSAttributedStringKey.paragraphStyle: pStyle], range: range)
        return atext
    }
    */
    
    static func makeHyperlinkAttributedString(text: String, link: String) -> NSAttributedString {
        let atext = NSMutableAttributedString(string: text)
        let range = NSMakeRange(0, text.count)
        atext.addAttributes([NSAttributedStringKey.link: link], range: range)
        return atext
    }
}
