//
//  KRActivityIndicatorViewTests.swift
//  KRActivityIndicatorViewTests
//
//  Created by Krimpedance on 2017/05/10.
//  Copyright © 2017年 Krimpedance. All rights reserved.
//

import XCTest
@testable import KRActivityIndicatorView

class KRActivityIndicatorViewTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
}

// MARK: - KRActivityIndicatorStyle tests

extension KRActivityIndicatorViewTests {
    func testKRActivityIndicatorViewStyleColors() {
      let simpleStyle = KRActivityIndicatorViewStyle.color(.red)
      XCTAssertEqual(simpleStyle.headColor, .red)
      XCTAssertEqual(simpleStyle.tailColor, .red)

      let gradationStyle = KRActivityIndicatorViewStyle.gradationColor(head: .red, tail: .blue)
      XCTAssertEqual(gradationStyle.headColor, .red)
      XCTAssertEqual(gradationStyle.tailColor, .blue)
    }

   func testGetGradientColors() {
      let style = KRActivityIndicatorViewStyle.gradationColor(head: .orange, tail: .yellow)
      let colors = style.getGradientColors(dividedIn: 8)
      XCTAssertEqual(colors.count, 8)
      XCTAssertEqual(colors.first, .orange)
      XCTAssertEqual(colors.last, .yellow)
   }
}

// MARK: - KRActivityIndicatorStyle tests

extension KRActivityIndicatorViewTests {
   func testInitialize() {
      let view = KRActivityIndicatorView(style: .gradationColor(head: .red, tail: .green))
      XCTAssertEqual(view.headColor, .red)
      XCTAssertEqual(view.tailColor, .green)
   }

   func testAnimationState() {
      let view = KRActivityIndicatorView(style: .color(.green))
      view.startAnimating()
      XCTAssertEqual(view.isAnimating, true)
      view.stopAnimating()
      XCTAssertEqual(view.isAnimating, false)
   }
}
