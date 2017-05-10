//
//  KRActivityIndicatorPath.swift
//  KRActivityIndicatorView
//
//  Copyright © 2017年 Krimpedance. All rights reserved.
//

import UIKit

/**
 *  KRActivityIndicator Path
 */

struct KRActivityIndicatorPath {
   private static let paths: [CGPath] = [
      UIBezierPath(ovalIn: CGRect(x: 4.472, y: 0.209, width: 4.801, height: 4.801)).cgPath,
      UIBezierPath(ovalIn: CGRect(x: 0.407, y: 5.154, width: 4.321, height: 4.321)).cgPath,
      UIBezierPath(ovalIn: CGRect(x: 0.93, y: 11.765, width: 3.841, height: 3.841)).cgPath,
      UIBezierPath(ovalIn: CGRect(x: 5.874, y: 16.31, width: 3.361, height: 3.361)).cgPath,
      UIBezierPath(ovalIn: CGRect(x: 12.341, y: 16.126, width: 3.169, height: 3.169)).cgPath,
      UIBezierPath(ovalIn: CGRect(x: 16.912, y: 11.668, width: 2.641, height: 2.641)).cgPath,
      UIBezierPath(ovalIn: CGRect(x: 16.894, y: 5.573, width: 2.115, height: 2.115)).cgPath,
      UIBezierPath(ovalIn: CGRect(x: 12.293, y: 1.374, width: 1.901, height: 1.901)).cgPath
      ]

   private static let largePaths: [CGPath] = [
      UIBezierPath(ovalIn: CGRect(x: 12.013, y: 1.962, width: 8.336, height: 8.336)).cgPath,
      UIBezierPath(ovalIn: CGRect(x: 1.668, y: 14.14, width: 7.502, height: 7.502)).cgPath,
      UIBezierPath(ovalIn: CGRect(x: 2.792, y: 30.484, width: 6.668, height: 6.668)).cgPath,
      UIBezierPath(ovalIn: CGRect(x: 14.968, y: 41.665, width: 5.835, height: 5.835)).cgPath,
      UIBezierPath(ovalIn: CGRect(x: 31.311, y: 41.381, width: 5.001, height: 5.001)).cgPath,
      UIBezierPath(ovalIn: CGRect(x: 42.496, y: 30.041, width: 4.168, height: 4.168)).cgPath,
      UIBezierPath(ovalIn: CGRect(x: 42.209, y: 14.515, width: 3.338, height: 3.338)).cgPath,
      UIBezierPath(ovalIn: CGRect(x: 30.857, y: 4.168, width: 2.501, height: 2.501)).cgPath
      ]

   static func getPath(isLarge: Bool) -> [CGPath] {
      return isLarge ? largePaths : paths
   }
}
