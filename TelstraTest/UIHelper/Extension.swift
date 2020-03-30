//
//  Extension.swift
//  TelstraTest
//
//  Created by saurabh suman on 28/03/20.
//  Copyright © 2020 saurabh suman. All rights reserved.
//

import UIKit

extension UIImageView {
  // This method load image from url string
  func loadImagesfromURL(urlString:String) {
    URLSession.shared.dataTask( with: NSURL(string:urlString)! as URL, completionHandler: {
      (data,response,error) -> Void in
      DispatchQueue.main.async {
        if let data = data {
          self.image = UIImage(data: data)
        }
      }
    }).resume()
  }
}
extension UIActivityIndicatorView {
  
  static func activityIndicatorToView(_ view: UIView) -> UIActivityIndicatorView {
    let activityIndicator = UIActivityIndicatorView()
    activityIndicator.backgroundColor = UIColor.white
    activityIndicator.color = UIColor.gray
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(activityIndicator)
    AutoLayoutHelper.addHorizontalAlignConstraintToView(activityIndicator, withCenterOffset: 0)
    AutoLayoutHelper.addVerticalAlignConstraintToView(activityIndicator, withCenterOffset: 0, priority:.required)
    AutoLayoutHelper.addWidthConstraintToView(activityIndicator, value: 60)
    AutoLayoutHelper.addHeightConstraintToView(activityIndicator, value: 60)
    return activityIndicator
  }
}
