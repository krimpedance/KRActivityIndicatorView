//
//  ViewController.swift
//  KRActivityIndicatorViewDemo
//
//  Copyright © 2016年 Krimpedance. All rights reserved.
//

import UIKit
import KRActivityIndicatorView

class ViewController: UIViewController {

    @IBOutlet weak var activityIndicator: KRActivityIndicatorView!
    @IBOutlet weak var activityIndicatorWidthConstraint: NSLayoutConstraint!

    var colors: [UIColor?] = [.black, nil, nil, nil, .lightGray]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UISegmentedControl value change actions ------------

extension ViewController {
    @IBAction func changedAnimatingControlValue(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            activityIndicator.animating = true
            activityIndicator.startAnimating()
        } else {
            activityIndicator.animating = false
            activityIndicator.stopAnimating()
        }
    }

    @IBAction func sizeSliderValueChanged(sender: UISlider) {
        activityIndicatorWidthConstraint.constant = 68 * CGFloat(sender.value)
    }

    @IBAction func numberOfDotsSliderValueChanged(sender: UISlider) {
        activityIndicator.numberOfDots = Int(sender.value)
    }

    @IBAction func colorButton1Tapped(sender: UIButton) {
        colors[0] = sender.backgroundColor
        activityIndicator.colors = colors.compactMap { $0 }
    }

    @IBAction func colorButton2Tapped(sender: UIButton) {
        colors[1] = (sender.tag == 0) ? nil : sender.backgroundColor
        activityIndicator.colors = colors.compactMap { $0 }
    }

    @IBAction func colorButton3Tapped(sender: UIButton) {
        colors[2] = (sender.tag == 0) ? nil : sender.backgroundColor
        activityIndicator.colors = colors.compactMap { $0 }
    }

    @IBAction func colorButton4Tapped(sender: UIButton) {
        colors[3] = (sender.tag == 0) ? nil : sender.backgroundColor
        activityIndicator.colors = colors.compactMap { $0 }
    }

    @IBAction func colorButton5Tapped(sender: UIButton) {
        colors[4] = sender.backgroundColor
        activityIndicator.colors = colors.compactMap { $0 }
    }
}
