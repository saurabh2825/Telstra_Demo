//
//  Extension.swift
//  TelstraTest
//
//  Created by saurabh suman on 28/03/20.
//  Copyright © 2020 saurabh suman. All rights reserved.
//

import UIKit

extension UIImageView {

func loadImagesfromURL(urlString:String)  {
    URLSession.shared.dataTask( with: NSURL(string:urlString)! as URL, completionHandler: {
       (data, response, error) -> Void in
       DispatchQueue.main.async {
          if let data = data {
             self.image = UIImage(data: data)
          }
       }
    }).resume()
  
}
}
