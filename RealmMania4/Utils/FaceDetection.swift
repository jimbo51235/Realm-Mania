//
//  FaceDetection.swift
//  Look4Faces 2
//
//  Created by Kimberly on 2017/11/01.
//  Copyright © 2017 Kimberly. All rights reserved.
//

import UIKit
import CoreGraphics

class FaceDetection {
    static func countFace(image: UIImage, type: Int) -> Int {
        if let ciImage = CIImage(image: image) {
            let accuracy = [CIDetectorAccuracy: CIDetectorAccuracyHigh]
            if type == 0 {
                let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: accuracy)
                let faces = faceDetector?.features(in: ciImage)
                var count = Int()
                for face in faces as! [CIFaceFeature] {
                    if face.hasLeftEyePosition && face.hasRightEyePosition && face.hasMouthPosition {
                        count += 1
                    }
                }
                return count
            }
            else {
                let textDetector = CIDetector(ofType: CIDetectorTypeText, context: nil, options: accuracy)
                let texts = textDetector?.features(in: ciImage)
                var count = Int()
                for text in texts as! [CITextFeature] {
                    if text.bounds.size.width > 0 {
                        count += 1
                    }
                }
                return count
            }
            
        } else {
            return 0
        }
    }
    
    static func getFaceRect(image: UIImage) -> [CGRect]? {
        var rects = [CGRect]()
        if let ciImage = CIImage(image: image) {
            let accuracy = [CIDetectorAccuracy: CIDetectorAccuracyHigh]
            let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: accuracy)
            let faces = faceDetector?.features(in: ciImage)
            for face in faces as! [CIFaceFeature] {
                if face.hasLeftEyePosition && face.hasRightEyePosition && face.hasMouthPosition {
                    rects.append(face.bounds)
                }
            }
        }
        return rects
    }
    
    static func getEyePositions(image: UIImage) -> [CGPoint]? {
        var points = [CGPoint]()
        if let ciImage = CIImage(image: image) {
            let accuracy = [CIDetectorAccuracy: CIDetectorAccuracyHigh]
            let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: accuracy)
            let faces = faceDetector?.features(in: ciImage)
            for face in faces as! [CIFaceFeature] {
                if face.hasLeftEyePosition && face.hasRightEyePosition && face.hasMouthPosition {
                    points.append(face.leftEyePosition)
                    points.append(face.rightEyePosition)
                    points.append(face.mouthPosition)
                }
            }
        }
        return points
    }
}

