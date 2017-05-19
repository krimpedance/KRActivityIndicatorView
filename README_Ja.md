[English](./README.md)

# KRActivityIndicatorView

[![Version](https://img.shields.io/cocoapods/v/KRActivityIndicatorView.svg?style=flat)](http://cocoapods.org/pods/KRActivityIndicatorView)
[![License](https://img.shields.io/cocoapods/l/KRActivityIndicatorView.svg?style=flat)](http://cocoapods.org/pods/KRActivityIndicatorView)
[![Platform](https://img.shields.io/cocoapods/p/KRActivityIndicatorView.svg?style=flat)](http://cocoapods.org/pods/KRActivityIndicatorView)
[![Download](https://img.shields.io/cocoapods/dt/KRActivityIndicatorView.svg?style=flat)](http://cocoapods.org/pods/KRActivityIndicatorView)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CI Status](http://img.shields.io/travis/krimpedance/KRActivityIndicatorView.svg?style=flat)](https://travis-ci.org/krimpedance/KRActivityIndicatorView)

`KRActivityIndicatorView` は, Swiftで書かれたシンプルで自在に色をカスタムできるインジケーターです.

IB, コードのどちらからでも利用できます.

<img src="./Resources/demo.gif" height=400>

HUD => https://github.com/krimpedance/KRProgressHUD

## 特徴
- 丸いインジケータ
- カラーのカスタマイズ性

## 必要環境
- iOS 9.0+
- Xcode 8.0+
- Swift 3.0+

## デモ
`DEMO/`以下にあるサンプルプロジェクトから確認してください．

または，[Appetize.io](https://appetize.io/app/v73ez7gvuzzuhxecu4zqv4em0r)にてシュミレートしてください．

## インストール
KRActivityIndicatorViewは[CocoaPods](http://cocoapods.org)と[Carthage](https://github.com/Carthage/Carthage)で
インストールすることができます．

```ruby
# Podfile
pod "KRActivityIndicatorView"
```

```ruby
# Cartfile
github "Krimpedance/KRActivityIndicatorView"
```

## 使い方
(`/Demo`以下のサンプルを見てみてください)

大体の使い方は `UIActivityIndicatorView` と同じです.

#### 表示

簡単な表示方法

```swift
let activityIndicator = KRActivityIndicatorView()
view.addSubview(activityIndicator)
```

単色を設定しつつ初期化

```swift
KRActivityIndicatorView(style: .color(.green))
```

グラデーションカラーを設定しつつ初期化

```swift
KRActivityIndicatorView(style: .gradationColor(head: .red, tail: .orange))
```

#### アニメーションの開始/終了

```
activityIndicator.startAnimating()
activityIndicator.stopAnimating()
```

## カスタマイズ

#### KRActivityIndicatorViewStyle

* `color(color)` - インジケータの色は `color` になります.
* `color(head: UIColor, tail: UIColor)` - インジケータの色は, `head` の色から `tail` の色へのグラデーションになります.

#### IBで設定できるパラメータ:
* `headColor` - グラデーションの開始色
* `tailColor` - グラデーションの終了色
* `isLarge` - KRActivityIndicatorViewのサイズ設定. 初期(off)サイズは20x20で, 拡大時が50x50になります.
* `animating` - インジケータの表示時にアニメーションを開始するかどうかの設定.
* `hidesWhenStopped` - アニメーションを終了した時にインジケータを隠すかどうかの設定.

## ライブラリに関する質問等
バグや機能のリクエストがありましたら，気軽にコメントしてください．

## リリースノート
- 2.0.2 : `headColor` と 'tailColor'の値が変わらないバグを修正.
- 2.0.1 : `hidesWhenStopped` のバグを修正.
- 2.0.0 : CocoaPods, Carthageで利用できるようになりました.

## ライセンス
KRActivityIndicatorViewはMITライセンスに準拠しています.
詳しくは`LICENSE`ファイルをみてください.
