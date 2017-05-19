//
//  KRActivityIndicatorViewStyle.swift
//  KRProgressIndicator
//
//  Copyright © 2016年 Krimpedance. All rights reserved.
//

import UIKit

/**
 KRActivityIndicatorView's style
 
 - **color(color):**  The fill color of activity indicator is set to `color`.
 - **color(head: UIColor, tail: UIColor):**  The fill color of activity indicator is gradated from `head` color to `tail` color.
 */
public enum KRActivityIndicatorViewStyle {
   case color(UIColor)
   case gradationColor(head: UIColor, tail: UIColor)

   public var headColor: UIColor {
      switch self {
      case let .color(color):  return color
      case let .gradationColor(head: color, tail: _) :  return color
      }
   }

   public var tailColor: UIColor {
      switch self {
      case let .color(color):  return color
      case let .gradationColor(head: _, tail: color) :  return color
      }
   }
}

extension KRActivityIndicatorViewStyle {
   func getGradientColors(dividedIn num: Int) -> [UIColor] {
      let gradient = CAGradientLayer()
      gradient.frame = CGRect(x: 0, y: 0, width: 2, height: (num-1) * 10)
      gradient.colors = [headColor.cgColor, tailColor.cgColor]

      var colors = [UIColor]()

      colors.append(headColor)
      (1..<num-1).forEach {
         let point = CGPoint(x: 1, y: 10*CGFloat($0))
         let color = gradient.color(point: point)
         colors.append(color)
      }
      colors.append(tailColor)

      return colors
   }
}

// MARK: - CAGradientLayer Extension ------------------------------

private extension CAGradientLayer {
   func color(point: CGPoint) -> UIColor {
      var pixel: [CUnsignedChar] = [0, 0, 0, 0]
      let colorSpace = CGColorSpaceCreateDeviceRGB()
      let bitmap = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
      let context = CGContext(data: &pixel, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace, bitmapInfo: bitmap.rawValue)

      context?.translateBy(x: -point.x, y: -point.y)
      render(in: context!)

      let red: CGFloat = CGFloat(pixel[0])/255.0
      let green: CGFloat = CGFloat(pixel[1])/255.0
      let blue: CGFloat = CGFloat(pixel[2])/255.0
      let alpha: CGFloat = CGFloat(pixel[3])/255.0

      return UIColor(red:red, green: green, blue:blue, alpha:alpha)
   }
}
