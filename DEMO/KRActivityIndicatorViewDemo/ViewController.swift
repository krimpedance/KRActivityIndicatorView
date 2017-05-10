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

   @IBAction func changedActivityIndicatorViewSizeControlValue(sender: UISegmentedControl) {
      activityIndicator.isLarge = sender.selectedSegmentIndex != 0
   }

   @IBAction func changedActivityIndicatorViewStyleControlValue(sender: UISegmentedControl) {
      activityIndicator.backgroundColor = .white
      switchColorPartsHidden(hidden: true)

      switch sender.selectedSegmentIndex {
      case 0 :
         activityIndicator.style = .gradationColor(head: .black, tail: .lightGray)

      default :
         switchColorPartsHidden(hidden: false)
         let headColor = colors[startColorControl.selectedSegmentIndex]
         let tailColor = colors[endColorControl.selectedSegmentIndex]
         activityIndicator.style = .gradationColor(head: headColor, tail: tailColor)
      }
   }

   @IBAction func changedHeadColorControlValue(sender: UISegmentedControl) {
      let endColor = colors[endColorControl.selectedSegmentIndex]
      switch sender.selectedSegmentIndex {
      case 0 :
         activityIndicator.style = .gradationColor(head: colors[0], tail: endColor)

      case 1 :
         activityIndicator.style = .gradationColor(head: colors[1], tail: endColor)

      case 2 :
         activityIndicator.style = .gradationColor(head: colors[2], tail: endColor)

      case 3 :
         activityIndicator.style = .gradationColor(head: colors[3], tail: endColor)

      case 4 :
         activityIndicator.style = .gradationColor(head: colors[4], tail: endColor)

      default : break
      }
   }

   @IBAction func changedTailColorControlValue(sender: UISegmentedControl) {
      let startColor = colors[startColorControl.selectedSegmentIndex]
      switch sender.selectedSegmentIndex {
      case 0 :
         activityIndicator.style = .gradationColor(head: startColor, tail: colors[0])

      case 1 :
         activityIndicator.style = .gradationColor(head: startColor, tail: colors[1])

      case 2 :
         activityIndicator.style = .gradationColor(head: startColor, tail: colors[2])

      case 3 :
         activityIndicator.style = .gradationColor(head: startColor, tail: colors[3])

      case 4 :
         activityIndicator.style = .gradationColor(head: startColor, tail: colors[4])

      default : break
      }
   }
}
