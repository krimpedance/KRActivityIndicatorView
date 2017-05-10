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

   @IBOutlet weak var animatingControl: UISegmentedControl!
   @IBOutlet weak var startColorLabel: UILabel!
   @IBOutlet weak var startColorControl: UISegmentedControl!
   @IBOutlet weak var endColorLabel: UILabel!
   @IBOutlet weak var endColorControl: UISegmentedControl!

   let colors: [UIColor] = [
      .red,
      .green,
      .blue,
      .orange,
      .yellow
   ]

   override func viewDidLoad() {
      super.viewDidLoad()

      switchColorPartsHidden(hidden: true)

      activityIndicator.layer.borderWidth = 2
      activityIndicator.layer.borderColor = UIColor.black.cgColor
   }

   func switchColorPartsHidden(hidden: Bool) {
      startColorLabel.isHidden = hidden
      startColorControl.isHidden = hidden
      endColorLabel.isHidden = hidden
      endColorControl.isHidden = hidden
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
      activityIndicator.backgroundColor = UIColor.white
      switchColorPartsHidden(hidden: true)

      switch sender.selectedSegmentIndex {
      case 0 :
         if activityIndicator.largeStyle {
            activityIndicator.activityIndicatorViewStyle = .largeBlack
         } else {
            activityIndicator.activityIndicatorViewStyle = .black
         }

      case 1 :
         activityIndicator.backgroundColor = UIColor.black
         if activityIndicator.largeStyle {
            activityIndicator.activityIndicatorViewStyle = .largeWhite
         } else {
            activityIndicator.activityIndicatorViewStyle = .white
         }

      case 2 :
         switchColorPartsHidden(hidden: false)
         let startColor = colors[startColorControl.selectedSegmentIndex]
         let endColor = colors[endColorControl.selectedSegmentIndex]
         if activityIndicator.largeStyle {
            activityIndicator.activityIndicatorViewStyle = .largeColor(startColor, endColor)
         } else {
            activityIndicator.activityIndicatorViewStyle = .color(startColor, endColor)
         }

      default : break
      }
   }

   @IBAction func changedStartColorControlValue(sender: UISegmentedControl) {
      let endColor = colors[endColorControl.selectedSegmentIndex]
      switch sender.selectedSegmentIndex {
      case 0 :
         activityIndicator.activityIndicatorViewStyle = activityIndicator.largeStyle ? .largeColor(colors[0], endColor) : .color(colors[0], endColor)

      case 1 :
         activityIndicator.activityIndicatorViewStyle = activityIndicator.largeStyle ? .largeColor(colors[1], endColor) : .color(colors[1], endColor)

      case 2 :
         activityIndicator.activityIndicatorViewStyle = activityIndicator.largeStyle ? .largeColor(colors[2], endColor) : .color(colors[2], endColor)

      case 3 :
         activityIndicator.activityIndicatorViewStyle = activityIndicator.largeStyle ? .largeColor(colors[3], endColor) : .color(colors[3], endColor)

      case 4 :
         activityIndicator.activityIndicatorViewStyle = activityIndicator.largeStyle ? .largeColor(colors[4], endColor) : .color(colors[4], endColor)

      default : break
      }
   }

   @IBAction func changedEndColorControlValue(sender: UISegmentedControl) {
      let startColor = colors[startColorControl.selectedSegmentIndex]
      switch sender.selectedSegmentIndex {
      case 0 :
         activityIndicator.activityIndicatorViewStyle = activityIndicator.largeStyle ? .largeColor(startColor, colors[0]) : .color(startColor, colors[0])

      case 1 :
         activityIndicator.activityIndicatorViewStyle = activityIndicator.largeStyle ? .largeColor(startColor, colors[1]) : .color(startColor, colors[1])

      case 2 :
         activityIndicator.activityIndicatorViewStyle = activityIndicator.largeStyle ? .largeColor(startColor, colors[2]) : .color(startColor, colors[2])

      case 3 :
         activityIndicator.activityIndicatorViewStyle = activityIndicator.largeStyle ? .largeColor(startColor, colors[3]) : .color(startColor, colors[3])

      case 4 :
         activityIndicator.activityIndicatorViewStyle = activityIndicator.largeStyle ? .largeColor(startColor, colors[4]) : .color(startColor, colors[4])

      default : break
      }
   }
}
