//
//  DashboardViewModelTest.swift
//  TelstraTestTests
//
//  Created by saurabh suman on 30/03/20.
//  Copyright © 2020 saurabh suman. All rights reserved.
//

import XCTest
@testable import TelstraTest

class DashboardViewModelTest: XCTestCase {
  var viewModel = DashboardViewModel()
  var model:DashboardModel?
  
    override func setUp() {
      
      // Put setup code here. This method is called before the invocation of each test method in the class.
     fillData()
  }
  
  
  func fillData()  {
    
    let exp = self.expectation(description: "myExpectation")
    var result: Int?
    viewModel.callServiceForTest(completionBlock: { (responseData) in
           do {
               let decoder = JSONDecoder()
               let data = try decoder.decode(DashboardModel.self, from: responseData)
               self.model = data
              XCTAssertNotNil(self.model)
            result = self.model?.rows?.count
            exp.fulfill()
           } catch {
           }
         }) { (error) in
         }
        wait(for: [exp], timeout: 10)
        XCTAssertEqual(result, 14)
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
  func testNavigationTitel() {
    if(self.model != nil){
      XCTAssertEqual(self.model?.title, "About Canada")
    }
  }
  func testNumberofRow() {
    if(self.model != nil){
      XCTAssertEqual(self.viewModel.getRequirdTableRow(),14)
    }
  }

  func testgetModelObjectaccordingtoIndexnumber() {
    let indexNumber = 1
    let rows = self.model?.rows![indexNumber]
    XCTAssertEqual(rows?.title,"Flag");
    XCTAssertEqual(rows?.description,nil)
    XCTAssertEqual(rows?.imageHref, "http://images.findicons.com/files/icons/662/world_flag/128/flag_of_canada.png")
   }
  


}
