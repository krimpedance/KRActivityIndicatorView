//
//  KRActivityIndicatorViewTests.swift
//  KRActivityIndicatorViewTests
//
//  Copyright © 2017 Krimpedance. All rights reserved.
//
//  swiftlint:disable function_body_length

import XCTest
import Quick
import Nimble
@testable import KRActivityIndicatorView

class KRActivityIndicatorViewTests: QuickSpec {
    override func spec() {
        describe("KRActivityIndicatorView") {
            it("can initialize") {
                let view = KRActivityIndicatorView()
                expect(view.frame.size).to(equal(CGSize(width: 20, height: 20)))
                expect(view.layer.sublayers!.count).to(equal(1))
                expect(view.headColor).to(equal(.black))
                expect(view.tailColor).to(equal(.lightGray))
                expect(view.numberOfDots).to(equal(8))
                expect(view.duration).to(equal(1.0))
                expect(view.animating).to(beTrue())
                expect(view.hidesWhenStopped).to(beFalse())
                expect(view.colors).to(equal([.black, .lightGray]))
                expect(view.isAnimating).to(beFalse())
            }

            it("can initialize with frame") {
                let frame = CGRect(x: 0, y: 0, width: 40, height: 40)
                let view = KRActivityIndicatorView(frame: frame)
                expect(view.frame).to(equal(frame))
                expect(view.layer.sublayers!.count).to(equal(1))
                expect(view.headColor).to(equal(.black))
                expect(view.tailColor).to(equal(.lightGray))
                expect(view.numberOfDots).to(equal(8))
                expect(view.duration).to(equal(1.0))
                expect(view.animating).to(beTrue())
                expect(view.hidesWhenStopped).to(beFalse())
                expect(view.colors).to(equal([.black, .lightGray]))
                expect(view.isAnimating).to(beFalse())
            }

            it("can initialize with colors") {
                let colors: [UIColor] = [.red, .blue, .yellow]
                let view = KRActivityIndicatorView(colors: colors)
                expect(view.frame.size).to(equal(CGSize(width: 20, height: 20)))
                expect(view.layer.sublayers!.count).to(equal(1))
                expect(view.headColor).to(equal(.red))
                expect(view.tailColor).to(equal(.yellow))
                expect(view.numberOfDots).to(equal(8))
                expect(view.duration).to(equal(1.0))
                expect(view.animating).to(beTrue())
                expect(view.hidesWhenStopped).to(beFalse())
                expect(view.colors).to(equal(colors))
                expect(view.isAnimating).to(beFalse())
            }

            it("can start animating") {
                let view = KRActivityIndicatorView()
                view.startAnimating()
                let layer = view.layer.sublayers![0]
                let key = layer.animationKeys()![0]
                expect(view.isAnimating).to(beTrue())
                expect(layer.animation(forKey: key)).notTo(beNil())
            }

            it("can stop animating") {
                let view = KRActivityIndicatorView()
                view.startAnimating()
                view.stopAnimating()
                let layer = view.layer.sublayers![0]
                let key = layer.animationKeys()
                expect(view.isAnimating).to(beFalse())
                expect(key).to(beNil())
            }

            it("animationLayer isHidden is true when hideWhenStopped") {
                let view = KRActivityIndicatorView()
                let layer = view.layer.sublayers![0]
                view.hidesWhenStopped = true
                expect(layer.isHidden).to(beTrue())
                view.startAnimating()
                expect(layer.isHidden).to(beFalse())
                view.stopAnimating()
                expect(layer.isHidden).to(beTrue())
            }
        }
    }
}
