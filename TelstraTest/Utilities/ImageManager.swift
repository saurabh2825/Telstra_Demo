//
//  ImageManager.swift
//  TelstraTest
//
//  Created by saurabh suman on 29/03/20.
//  Copyright © 2020 saurabh suman. All rights reserved.
//

import UIKit

class ImageManager: NSObject {

  static public let imgdownloadManager = ImageManager()
     
     public override init() {
         
     }
     public func downloadImage(imageUrl:String, completion: @escaping (UIImage?)->()) {
         let url = URL(string: imageUrl)
         URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
             guard let imgData = data else {
                // print("No data")
                 return
             }
             let image = UIImage(data: imgData)
             completion(image)
         }).resume()
     }
  
  
}
