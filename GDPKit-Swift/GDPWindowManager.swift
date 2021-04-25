//
//  GDPWindowManager.swift
//  HanYuanSchool
//
//  Created by sun on 2021/4/25.
//  Copyright © 2021 hanyuan. All rights reserved.
//

import Foundation
import UIKit

class GDPWindowManager {
    
    class func screenShot () -> UIImage {
        var imageSize = CGSize.zero
        let screenSize = UIScreen.main.bounds.size
        let orientation = UIApplication.shared.statusBarOrientation
        if orientation.isPortrait {
            imageSize = screenSize
        } else {
            imageSize = CGSize(width: screenSize.height, height: screenSize.width)
        }
        
        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0)
        if let context = UIGraphicsGetCurrentContext() {
            for window in UIApplication.shared.windows {
                context.saveGState()
                context.translateBy(x: window.center.x, y: window.center.y)
                context.concatenate(window.transform)
                context.translateBy(x: -window.bounds.size.width * window.layer.anchorPoint.x, y: -window.bounds.size.height * window.layer.anchorPoint.y)
                
                if orientation == UIInterfaceOrientation.landscapeLeft {
                    context.rotate(by: .pi / 2)
                    context.translateBy(x: 0, y: -imageSize.width)
                } else if orientation == UIInterfaceOrientation.landscapeRight {
                    context.rotate(by: -.pi / 2)
                    context.translateBy(x: -imageSize.height, y: 0)
                } else if orientation == UIInterfaceOrientation.portraitUpsideDown {
                    context.rotate(by: .pi)
                    context.translateBy(x: -imageSize.width, y: -imageSize.height)
                }
                if window.responds(to: #selector(UIView.drawHierarchy(in:afterScreenUpdates:))) {
                    window.drawHierarchy(in: window.bounds, afterScreenUpdates: true)
                } else {
                    window.layer.render(in: context)
                }
                context.restoreGState()
            }
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if let image = image {
            return image
        } else {
            return UIImage()
        }
    }
    
}
