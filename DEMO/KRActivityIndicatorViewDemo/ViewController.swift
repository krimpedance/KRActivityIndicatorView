//
//  ViewController.swift
//  KRActivityIndicatorViewDemo
//
//  Copyright © 2016年 Krimpedance. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var activityIndicator: KRActivityIndicatorView!

    @IBOutlet weak var animatingControl: UISegmentedControl!
    @IBOutlet weak var startColorLabel: UILabel!
    @IBOutlet weak var startColorControl: UISegmentedControl!
    @IBOutlet weak var endColorLabel: UILabel!
    @IBOutlet weak var endColorControl: UISegmentedControl!

    let colors :[UIColor] = [
        UIColor.redColor(),
        UIColor.greenColor(),
        UIColor.blueColor(),
        UIColor.orangeColor(),
        UIColor.yellowColor()
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        switchColorPartsHidden(true)

        activityIndicator.layer.borderWidth = 2
        activityIndicator.layer.borderColor = UIColor.blackColor().CGColor
    }

    func switchColorPartsHidden(hidden :Bool) {
        startColorLabel.hidden = hidden
        startColorControl.hidden = hidden
        endColorLabel.hidden = hidden
        endColorControl.hidden = hidden
    }
}


/**
 *  UISegmentedControl value change actions -----------------
 */
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

    @IBAction func changedHidesWhenStoppedControlValue(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            activityIndicator.hidesWhenStopped = false
        } else {
            activityIndicator.hidesWhenStopped = true
        }

        if animatingControl.selectedSegmentIndex == 1 {
            activityIndicator.stopAnimating()
        }
    }

    @IBAction func changedActivityIndicatorViewStyleControlValue(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            activityIndicator.largeStyle = false
        } else {
            activityIndicator.largeStyle = true
        }
    }                                                                    

    @IBAction func changedActivityIndicatorViewColorControlValue(sender: UISegmentedControl) {
        activityIndicator.backgroundColor = UIColor.whiteColor()
        switchColorPartsHidden(true)

        switch sender.selectedSegmentIndex {
        case 0 :
            if activityIndicator.largeStyle {
                activityIndicator.activityIndicatorViewStyle = .LargeBlack
            } else {
                activityIndicator.activityIndicatorViewStyle = .Black
            }

        case 1 :
            activityIndicator.backgroundColor = UIColor.blackColor()
            if activityIndicator.largeStyle {
                activityIndicator.activityIndicatorViewStyle = .LargeWhite
            } else {
                activityIndicator.activityIndicatorViewStyle = .White
            }

        case 2 :
            switchColorPartsHidden(false)
            let startColor = colors[startColorControl.selectedSegmentIndex]
            let endColor = colors[endColorControl.selectedSegmentIndex]
            if activityIndicator.largeStyle {
                activityIndicator.activityIndicatorViewStyle = .LargeColor(startColor, endColor)
            } else {
                activityIndicator.activityIndicatorViewStyle = .Color(startColor, endColor)
            }

        default : break
        }
    }

    @IBAction func changedStartColorControlValue(sender: UISegmentedControl) {
        let endColor = colors[endColorControl.selectedSegmentIndex]
        switch sender.selectedSegmentIndex {
        case 0 :
            if activityIndicator.largeStyle {
                activityIndicator.activityIndicatorViewStyle = .LargeColor(colors[0], endColor)
            } else {
                activityIndicator.activityIndicatorViewStyle = .Color(colors[0], endColor)
            }

        case 1 :
            if activityIndicator.largeStyle {
                activityIndicator.activityIndicatorViewStyle = .LargeColor(colors[1], endColor)
            } else {
                activityIndicator.activityIndicatorViewStyle = .Color(colors[1], endColor)
            }

        case 2 :
            if activityIndicator.largeStyle {
                activityIndicator.activityIndicatorViewStyle = .LargeColor(colors[2], endColor)
            } else {
                activityIndicator.activityIndicatorViewStyle = .Color(colors[2], endColor)
            }

        case 3 :
            if activityIndicator.largeStyle {
                activityIndicator.activityIndicatorViewStyle = .LargeColor(colors[3], endColor)
            } else {
                activityIndicator.activityIndicatorViewStyle = .Color(colors[3], endColor)
            }

        case 4 :
            if activityIndicator.largeStyle {
                activityIndicator.activityIndicatorViewStyle = .LargeColor(colors[4], endColor)
            } else {
                activityIndicator.activityIndicatorViewStyle = .Color(colors[4], endColor)
            }

        default : break
        }
    }

    @IBAction func changedEndColorControlValue(sender: UISegmentedControl) {
        let startColor = colors[startColorControl.selectedSegmentIndex]
        switch sender.selectedSegmentIndex {
        case 0 :
            if activityIndicator.largeStyle {
                activityIndicator.activityIndicatorViewStyle = .LargeColor(startColor, colors[0])
            } else {
                activityIndicator.activityIndicatorViewStyle = .Color(startColor, colors[0])
            }

        case 1 :
            if activityIndicator.largeStyle {
                activityIndicator.activityIndicatorViewStyle = .LargeColor(startColor, colors[1])
            } else {
                activityIndicator.activityIndicatorViewStyle = .Color(startColor, colors[1])
            }

        case 2 :
            if activityIndicator.largeStyle {
                activityIndicator.activityIndicatorViewStyle = .LargeColor(startColor, colors[2])
            } else {
                activityIndicator.activityIndicatorViewStyle = .Color(startColor, colors[2])
            }

        case 3 :
            if activityIndicator.largeStyle {
                activityIndicator.activityIndicatorViewStyle = .LargeColor(startColor, colors[3])
            } else {
                activityIndicator.activityIndicatorViewStyle = .Color(startColor, colors[3])
            }

        case 4 :
            if activityIndicator.largeStyle {
                activityIndicator.activityIndicatorViewStyle = .LargeColor(startColor, colors[4])
            } else {
                activityIndicator.activityIndicatorViewStyle = .Color(startColor, colors[4])
            }

        default : break
        }
    }
}