//
//  DashboardViewControllerTest.swift
//  TelstraTestTests
//
//  Created by saurabh suman on 30/03/20.
//  Copyright © 2020 saurabh suman. All rights reserved.
//

import XCTest
@testable import TelstraTest


var dashboardVC : DashboardViewController!
var navVC = UINavigationController()


class DashboardViewControllerTest: XCTestCase {
  override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    
    let sceneDelegate = UIApplication.shared.connectedScenes
        .first!.delegate as! SceneDelegate
    navVC = sceneDelegate.window!.rootViewController as! UINavigationController
    dashboardVC =  navVC.viewControllers[0] as? DashboardViewController
  }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

  func testTableView() {
          XCTAssertNotNil(dashboardVC.tableView)
      }
      
      func testTableViewDelegate() {
          XCTAssertNotNil(dashboardVC.tableView.delegate)
      }
      
      func testTableViewConfromsToTableViewDelegateProtocol() {
          XCTAssertTrue(dashboardVC.conforms(to: UITableViewDelegate.self))
          
      }
      
      func testTableViewDataSource() {
          XCTAssertNotNil(dashboardVC.tableView.dataSource)
      }
      
      func testTableViewConformsToTableViewDataSourceProtocol() {
          XCTAssertTrue(dashboardVC.conforms(to: UITableViewDataSource.self))
          XCTAssertTrue(dashboardVC.responds(to: #selector(dashboardVC.tableView(_:numberOfRowsInSection:))))
          XCTAssertTrue(dashboardVC.responds(to: #selector(dashboardVC.tableView(_:cellForRowAt:))))
      }


      
  }
  

