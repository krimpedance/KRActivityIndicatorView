//
//  ViewController.swift
//  KRActivityIndicatorViewDemo
//
//  Created by Ryunosuke Kirikihira on 2016/02/10.
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
        
        self.switchColorPartsHidden(true)
        
        self.activityIndicator.layer.borderWidth = 2
        self.activityIndicator.layer.borderColor = UIColor.blackColor().CGColor
    }
    
    func switchColorPartsHidden(hidden :Bool) {
        self.startColorLabel.hidden = hidden
        self.startColorControl.hidden = hidden
        self.endColorLabel.hidden = hidden
        self.endColorControl.hidden = hidden
    }
}


/**
 *  UISegmentedControl value change actions -----------------
 */
extension ViewController {
    @IBAction func changedAnimatingControlValue(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.activityIndicator.animating = true
            self.activityIndicator.startAnimating()
        } else {
            self.activityIndicator.animating = false
            self.activityIndicator.stopAnimating()
        }
    }
    
    @IBAction func changedHidesWhenStoppedControlValue(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.activityIndicator.hidesWhenStopped = false
        } else {
            self.activityIndicator.hidesWhenStopped = true
        }
     
        if self.animatingControl.selectedSegmentIndex == 1 {
            self.activityIndicator.stopAnimating()
        }
    }
    
    @IBAction func changedActivityIndicatorViewStyleControlValue(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.activityIndicator.largeStyle = false
        } else {
            self.activityIndicator.largeStyle = true
        }
    }                                                                    
    
    @IBAction func changedActivityIndicatorViewColorControlValue(sender: UISegmentedControl) {
        self.activityIndicator.backgroundColor = UIColor.whiteColor()
        self.switchColorPartsHidden(true)
        
        switch sender.selectedSegmentIndex {
        case 0 :
            if self.activityIndicator.largeStyle {
                self.activityIndicator.activityIndicatorViewStyle = .LargeBlack
            } else {
                self.activityIndicator.activityIndicatorViewStyle = .Black
            }
            
        case 1 :
            self.activityIndicator.backgroundColor = UIColor.blackColor()
            
            if self.activityIndicator.largeStyle {
                self.activityIndicator.activityIndicatorViewStyle = .LargeWhite
            } else {
                self.activityIndicator.activityIndicatorViewStyle = .White
            }
            
        case 2 :
            self.switchColorPartsHidden(false)
            let startColor = colors[self.startColorControl.selectedSegmentIndex]
            let endColor = colors[self.endColorControl.selectedSegmentIndex]
            
            if self.activityIndicator.largeStyle {
                self.activityIndicator.activityIndicatorViewStyle = .LargeColor(startColor, endColor)
            } else {
                self.activityIndicator.activityIndicatorViewStyle = .Color(startColor, endColor)
            }
            
        default : break
        }
    }
    
    @IBAction func changedStartColorControlValue(sender: UISegmentedControl) {
        let endColor = colors[self.endColorControl.selectedSegmentIndex]
        switch sender.selectedSegmentIndex {
        case 0 :
            if self.activityIndicator.largeStyle {
                self.activityIndicator.activityIndicatorViewStyle = .LargeColor(colors[0], endColor)
            } else {
                self.activityIndicator.activityIndicatorViewStyle = .Color(colors[0], endColor)
            }
            
        case 1 :
            if self.activityIndicator.largeStyle {
                self.activityIndicator.activityIndicatorViewStyle = .LargeColor(colors[1], endColor)
            } else {
                self.activityIndicator.activityIndicatorViewStyle = .Color(colors[1], endColor)
            }
            
        case 2 :
            if self.activityIndicator.largeStyle {
                self.activityIndicator.activityIndicatorViewStyle = .LargeColor(colors[2], endColor)
            } else {
                self.activityIndicator.activityIndicatorViewStyle = .Color(colors[2], endColor)
            }
            
        case 3 :
            if self.activityIndicator.largeStyle {
                self.activityIndicator.activityIndicatorViewStyle = .LargeColor(colors[3], endColor)
            } else {
                self.activityIndicator.activityIndicatorViewStyle = .Color(colors[3], endColor)
            }
            
        case 4 :
            if self.activityIndicator.largeStyle {
                self.activityIndicator.activityIndicatorViewStyle = .LargeColor(colors[4], endColor)
            } else {
                self.activityIndicator.activityIndicatorViewStyle = .Color(colors[4], endColor)
            }
            
        default : break
        }
    }
    
    @IBAction func changedEndColorControlValue(sender: UISegmentedControl) {
        let startColor = colors[self.startColorControl.selectedSegmentIndex]
        switch sender.selectedSegmentIndex {
        case 0 :
            if self.activityIndicator.largeStyle {
                self.activityIndicator.activityIndicatorViewStyle = .LargeColor(startColor, colors[0])
            } else {
                self.activityIndicator.activityIndicatorViewStyle = .Color(startColor, colors[0])
            }
            
        case 1 :
            if self.activityIndicator.largeStyle {
                self.activityIndicator.activityIndicatorViewStyle = .LargeColor(startColor, colors[1])
            } else {
                self.activityIndicator.activityIndicatorViewStyle = .Color(startColor, colors[1])
            }
            
        case 2 :
            if self.activityIndicator.largeStyle {
                self.activityIndicator.activityIndicatorViewStyle = .LargeColor(startColor, colors[2])
            } else {
                self.activityIndicator.activityIndicatorViewStyle = .Color(startColor, colors[2])
            }
            
        case 3 :
            if self.activityIndicator.largeStyle {
                self.activityIndicator.activityIndicatorViewStyle = .LargeColor(startColor, colors[3])
            } else {
                self.activityIndicator.activityIndicatorViewStyle = .Color(startColor, colors[3])
            }
            
        case 4 :
            if self.activityIndicator.largeStyle {
                self.activityIndicator.activityIndicatorViewStyle = .LargeColor(startColor, colors[4])
            } else {
                self.activityIndicator.activityIndicatorViewStyle = .Color(startColor, colors[4])
            }
            
        default : break
        }
    }
    
}