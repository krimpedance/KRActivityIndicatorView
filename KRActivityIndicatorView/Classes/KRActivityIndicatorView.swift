//
//  KRProgressIndicator.swift
//  KRProgressIndicator
//
//  Copyright © 2016年 Krimpedance. All rights reserved.
//

import UIKit

/**
 *  KRActivityIndicatorView is a simple and customizable activity indicator
 */
@IBDesignable
public final class KRActivityIndicatorView: UIView {
   fileprivate var animationLayer = CALayer()

   /// Activity indicator's head color (read-only).
   /// If you change color, change activityIndicatorViewStyle property.
   @IBInspectable public fileprivate(set) var headColor: UIColor {
      get {
         return style.headColor
      }
      set {
         style = .gradationColor(head: newValue, tail: tailColor)
      }
   }

   /// Activity indicator's tail color (read-only).
   /// If you change color, change activityIndicatorViewStyle property.
   @IBInspectable public fileprivate(set) var tailColor: UIColor {
      get {
         return style.tailColor
      }
      set {
         style = .gradationColor(head: headColor, tail: newValue)
      }
   }

   /// Size of activity indicator.
   /// Default(false) size is 20x20, large size is 50x50.
   @IBInspectable public var isLarge: Bool = false {
      didSet { viewResized() }
   }

   /// Animation of activity indicator when it's shown.
   @IBInspectable public var animating: Bool = true {
      didSet { animating ? startAnimating() : stopAnimating() }
   }

   /// set `true` to `isHidden` when call `stopAnimating()`
   @IBInspectable public var hidesWhenStopped: Bool = false {
      didSet { animationLayer.isHidden = !isAnimating && hidesWhenStopped }
   }

   /// Activity indicator color style.
   public var style = KRActivityIndicatorViewStyle.gradationColor(head: .black, tail: .lightGray) {
      didSet { drawIndicatorPath() }
   }

   /// Whether view performs animation
   public var isAnimating: Bool {
      return animationLayer.animation(forKey: "rotate") != nil
   }

   public required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      backgroundColor = UIColor.clear
      layer.addSublayer(animationLayer)
   }

   public override init(frame: CGRect) {
      super.init(frame: frame)
      backgroundColor = UIColor.clear
      layer.addSublayer(animationLayer)
   }

   public convenience init() {
      self.init(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
      backgroundColor = UIColor.clear
      layer.addSublayer(animationLayer)
   }

   /**
    Initializes and returns a newly allocated view object with the specified position.
    An initialized view object or nil if the object couldn't be created.
    
    - parameter activityIndicatorStyle:    Activity indicator default color use of KRActivityIndicatorViewStyle
    */
   public convenience init(style: KRActivityIndicatorViewStyle) {
      self.init(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
      self.style = style
      backgroundColor = UIColor.clear
      layer.addSublayer(animationLayer)
   }

   public override func layoutSubviews() {
      super.layoutSubviews()
      viewResized()
      if animating { startAnimating() }
   }
}

extension KRActivityIndicatorView {
   public func startAnimating() {
      if animationLayer.animation(forKey: "rotate") != nil { return }

      let animation = CABasicAnimation(keyPath: "transform.rotation")
      animation.fromValue = 0
      animation.toValue = Double.pi * 2
      animation.duration = 1.1
    animation.timingFunction = CAMediaTimingFunction(name: .linear)
      animation.isRemovedOnCompletion = false
      animation.repeatCount = Float(NSIntegerMax)
    animation.fillMode = .forwards
      animation.autoreverses = false

      animationLayer.isHidden = false
      animationLayer.add(animation, forKey: "rotate")
   }

   public func stopAnimating() {
      animationLayer.removeAllAnimations()
      animationLayer.isHidden = hidesWhenStopped
   }
}

private extension KRActivityIndicatorView {
   func viewResized() {
      let layerSize: CGFloat = isLarge ? 50 : 20
      animationLayer.frame = CGRect(x: 0, y: 0, width: layerSize, height: layerSize)
      animationLayer.position = CGPoint(x: layer.position.x-layer.frame.origin.x, y: layer.position.y-layer.frame.origin.y)
      animationLayer.isHidden = !isAnimating && hidesWhenStopped
      drawIndicatorPath()
   }

   func drawIndicatorPath() {
      animationLayer.sublayers?.forEach { $0.removeFromSuperlayer() }

      let paths = KRActivityIndicatorPath.getPath(isLarge: isLarge)
      let colors = style.getGradientColors(dividedIn: paths.count)

      paths.enumerated().forEach { index, path in
         let pathLayer = CAShapeLayer()
         pathLayer.frame = animationLayer.bounds
         pathLayer.fillColor = colors[index].cgColor
         pathLayer.lineWidth = 0
         pathLayer.path = path
         animationLayer.addSublayer(pathLayer)
      }
   }
}
