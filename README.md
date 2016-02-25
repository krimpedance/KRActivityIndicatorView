# KRActivityIndicatorView
KRActivityIndicatorView is a simple and customizable activity indicator written in Swift2.

You can add KRActivityIndicatorView from IB or ViewController.


### Example
https://www.youtube.com/watch?v=UZTlGpY0CU8
　　　　
[![](http://img.youtube.com/vi/UZTlGpY0CU8/0.jpg)](https://www.youtube.com/watch?v=UZTlGpY0CU8)

## Install
Drag `KRActivityIndicatorView.swift` to your Xcode project.

## Usage
(see sample Xcode project)  

Usage is almost same as UIActivityIndicatorView.

Show simple KRActivityIndicatorView.
```swift
let activityIndicator = KRActivityIndicatorView()
self.view.addSubview(activityIndicator)
```

Start and stop animation.
```
activityIndicator.startAnimating()
activityIndicator.stopAnimating()
```

## Configuration
#### KRActivityIndicatorViewStyle
* `.Black`, `.LargeBlack` - BlackColor to lightGrayColor gradation
* `.White`, `.LargeBlack` - WhiteColor(alpha:1.0) to WhiteColor(alpha:0.9) gradation
* `.Color(start, end)`, `.LargeColor(start, end)` - `start`, `end` is UIColor property. You can set gradient first and last color.

#### Current available params on IB:
* `headColor` - gradient first color.
* `tailColor` - gradient end color.
* `largeStyle` - Size of KRActivityIndicatorView (`on` is large)
* `animating` - Animation of activity indicator when it's shown
* `hidesWhenStopped` - calls `setHidden` when call `stopAnimating()`

## License
KRActivityIndicatorView is available under the MIT license.
See the LICENSE file for more info.
