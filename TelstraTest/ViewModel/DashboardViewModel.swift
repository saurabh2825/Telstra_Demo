//
//  DashboardViewModel.swift
//  TelstraTest
//
//  Created by saurabh suman on 28/03/20.
//  Copyright © 2020 saurabh suman. All rights reserved.
//

import UIKit

class DashboardViewModel: NSObject {
  
  var dashboardData: DashboardModel?
  // This method will called network class and get data from remote server.
  func getDashboardData(successBlock: @escaping () -> Void, failureBlock: @escaping (Error?) -> Void) {
    let urlString = NetworkURL.baseUrl + NetworkURL.dashboardUrl
    NetworkManager.sharedManager.callService(urlString: urlString, completionBlock: { (responseData) in
      if let dataString = String(data: responseData, encoding: .isoLatin1) {
        // Converting string to data
        if let data = dataString.data(using: .utf8) {
          do {
            let decoder = JSONDecoder()
            let data = try decoder.decode(DashboardModel.self, from: data)
            // Assigned dashboardModel class data.
            self.dashboardData = data
            successBlock()
          } catch {
            failureBlock(error)
          }
        }
      }
    }) { (error) in
      failureBlock(error)
    }
  }
  //Return dashboard data model based on indexpath
  func getCellDataforIndexPath(indexNumber:Int) -> Rows {
    return (dashboardData?.rows?[indexNumber])!
  }
  // Return total data count need to show in table
  func getRequirdTableRow() -> Int {
    return dashboardData?.rows?.count ?? 0
  }
  // Return navigation title
  func setNavigationTitle() -> String {
    return dashboardData?.title ?? ""
  }
  
}
