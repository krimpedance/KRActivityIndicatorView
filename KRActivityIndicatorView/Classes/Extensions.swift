//
//  Extensions.swift
//  KRActivityIndicatorView
//
//  Copyright © 2018 Krimpedance. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    func color(point: CGPoint) -> UIColor {
        var pixel: [UInt8] = [0, 0, 0, 0]
        let context = CGContext(
            data: &pixel,
            width: 1,
            height: 1,
            bitsPerComponent: 8,
            bytesPerRow: 4,
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
        )

        context!.translateBy(x: -point.x, y: -point.y)
        render(in: context!)

        let red: CGFloat = CGFloat(pixel[0])/255.0
        let green: CGFloat = CGFloat(pixel[1])/255.0
        let blue: CGFloat = CGFloat(pixel[2])/255.0
        let alpha: CGFloat = CGFloat(pixel[3])/255.0

        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
