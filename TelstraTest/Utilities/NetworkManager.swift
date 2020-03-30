//
//  NetworkManager.swift
//  TelstraTest
//
//  Created by saurabh suman on 28/03/20.
//  Copyright © 2020 saurabh suman. All rights reserved.
//

import UIKit

class NetworkManager {
  static let sharedManager = NetworkManager()
  private init() {
  }
 //This method intrect with server and fetchdata from there.
  func callService(urlString: String,completionBlock: @escaping (_ response: Data) -> Void, failureBlock: @escaping (Error?) -> Void) {
    guard let url = URL(string: urlString) else {
      print("Error in creating URL")
      return
    }
    let getData = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard error == nil else {
        print("Network Call Error")
        failureBlock(error)
        return
      }
      if let responseData = data {
        completionBlock(responseData)
      }
    }
    getData.resume()
  }
}
