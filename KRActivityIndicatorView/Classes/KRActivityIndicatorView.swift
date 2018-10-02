//
//  KRActivityIndicatorView.swift
//  KRActivityIndicatorView
//
//  Copyright © 2016 Krimpedance. All rights reserved.
//

import UIKit

/// KRActivityIndicatorView is a simple and customizable activity indicator
@IBDesignable
public final class KRActivityIndicatorView: UIView {
    private let animationKey = "KRActivityIndicatorViewAnimationKey"

    private var animationLayer = CALayer()

    /// Activity indicator's head color (read-only).
    /// You can set head color from IB.
    /// If you want to change color from code, use colors property.
    @IBInspectable public fileprivate(set) var headColor: UIColor {
        get { return colors.first ?? .black }
        set { colors = [newValue, tailColor] }
    }

    /// Activity indicator's tail color (read-only).
    /// You can set tail color from IB.
    /// If you want to change color from code, use colors property.
    @IBInspectable public fileprivate(set) var tailColor: UIColor {
        get { return colors.last ?? .black }
        set { colors = [headColor, newValue] }
    }

    /// Number of dots
    @IBInspectable public var numberOfDots: Int = 8 {
        didSet { drawIndicatorPath() }
    }

    // Duration for one rotation
    @IBInspectable public var duration: Double = 1.0 {
        didSet {
            guard isAnimating else { return }
            stopAnimating()
            startAnimating()
        }
    }

    /// Animation of activity indicator when it's shown.
    @IBInspectable public var animating: Bool = true {
        didSet { animating ? startAnimating() : stopAnimating() }
    }

    /// set `true` to `isHidden` when call `stopAnimating()`
    @IBInspectable public var hidesWhenStopped: Bool = false {
        didSet { animationLayer.isHidden = !isAnimating && hidesWhenStopped }
    }

    /// Activity indicator gradient colors.
    public var colors: [UIColor] = [.black, .lightGray] {
        didSet { drawIndicatorPath() }
    }

    /// Whether view performs animation
    public var isAnimating: Bool {
        return animationLayer.animation(forKey: animationKey) != nil
    }

    // Initializer ----------

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.addSublayer(animationLayer)
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        layer.addSublayer(animationLayer)
    }

    /// Initializer
    public convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    }

    /// Initializer with colors
    ///
    /// - Parameter colors: Activity indicator gradient colors.
    public convenience init(colors: [UIColor]) {
        self.init(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        self.colors = colors
    }

    // Deprecated ----------

    /// Activity indicator color style.
    @available(*, deprecated)
    public var style = KRActivityIndicatorViewStyle.gradationColor(head: .black, tail: .lightGray) {
        didSet { colors = [style.headColor, style.tailColor] }
    }

    /// Initialize with style.
    /// - Parameter style: Activity indicator default color use of KRActivityIndicatorViewStyle
    @available(*, deprecated)
    public convenience init(style: KRActivityIndicatorViewStyle) {
        self.init(colors: [style.headColor, style.tailColor])
    }

    // Lyfecycle ----------

    public override func layoutSubviews() {
        super.layoutSubviews()
        viewResized()
    }
}

// MARK: - Private actions ------------

private extension KRActivityIndicatorView {
    func viewResized() {
        animationLayer.frame = layer.bounds
        animationLayer.isHidden = !isAnimating && hidesWhenStopped
        drawIndicatorPath()
    }

    func drawIndicatorPath() {
        animationLayer.sublayers?.forEach { $0.removeFromSuperlayer() }

        let width = Double(min(animationLayer.bounds.width, animationLayer.bounds.height))

        // 各ドットの直径を求めるためのベースとなる比率
        let diff = 0.6 / Double(numberOfDots-1)
        let baseRatio = 100 / (1.8 * Double(numberOfDots) - Double(numberOfDots * (numberOfDots - 1)) * diff)

        // ベースとなる円の直径(レイヤー内にドットが収まるように調整する)
        var diameter = width
        while true {
            let circumference = diameter * Double.pi
            let dotDiameter = baseRatio * 0.9 * circumference / 100
            let space = width - diameter - dotDiameter
            if space > 0 { break }
            diameter -= 2
        }

        let colors = getGradientColors(dividedIn: numberOfDots)
        let circumference = diameter * Double.pi
        let spaceRatio = 50 / Double(numberOfDots) / 100

        var degree = Double(20) // 全体を 20° 傾ける

        (0..<numberOfDots).forEach {
            let number = Double($0)
            let ratio = (0.9 - diff * number) * baseRatio / 100
            let dotDiameter = circumference * ratio
            let rect = CGRect(
                x: (width - dotDiameter) / 2,
                y: (width - diameter - dotDiameter) / 2,
                width: dotDiameter,
                height: dotDiameter
            )
            if number != 0 {
                let preRatio = (0.9 - diff * (number - 1)) * baseRatio / 100
                let arc = (preRatio / 2 + spaceRatio + ratio / 2) * circumference
                degree += 360 * arc / circumference
            }

            let pathLayer = CAShapeLayer()
            pathLayer.frame.size = CGSize(width: width, height: width)
            pathLayer.position = animationLayer.position
            pathLayer.fillColor = colors[$0].cgColor
            pathLayer.lineWidth = 0
            pathLayer.path = UIBezierPath(ovalIn: rect).cgPath
            pathLayer.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat(-degree) * CGFloat.pi / 180))
            animationLayer.addSublayer(pathLayer)
        }
    }

    func getGradientColors(dividedIn num: Int) -> [UIColor] {
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: 2, height: (num-1) * 10 + 1)
        gradient.colors = colors.map { $0.cgColor }

        return (0..<num).map {
            let point = CGPoint(x: 1, y: 10*CGFloat($0))
            return gradient.color(point: point)
        }
    }
}

// MARK: - Public actions ------------------

public extension KRActivityIndicatorView {
    /// Start animating.
    func startAnimating() {
        if animationLayer.animation(forKey: animationKey) != nil { return }

        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue = 0
        animation.toValue = Double.pi * 2
        animation.duration = duration
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.isRemovedOnCompletion = false
        animation.repeatCount = Float(NSIntegerMax)
        animation.fillMode = .forwards
        animation.autoreverses = false

        animationLayer.isHidden = false
        animationLayer.add(animation, forKey: animationKey)
    }

    /// Stop animating.
    func stopAnimating() {
        animationLayer.removeAllAnimations()
        animationLayer.isHidden = hidesWhenStopped
    }
}
