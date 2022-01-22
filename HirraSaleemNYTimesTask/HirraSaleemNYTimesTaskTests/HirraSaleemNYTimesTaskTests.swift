//
//  HirraSaleemNYTimesTaskTests.swift
//  HirraSaleemNYTimesTaskTests
//
//  Created by Hirra on 22/01/2022.
//

import XCTest
@testable import HirraSaleemNYTimesTask

class HirraSaleemNYTimesTaskTests: XCTestCase {
    var sut: URLSession!
    let networkMonitor = NetworkMonitor.shared

    override func setUpWithError() throws {
        sut = URLSession(configuration: .default)

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testValidApiCallGetsHTTPStatusCode200() throws {
      try XCTSkipUnless(
        networkMonitor.isReachable,
        "Network connectivity test")

      // given
      let urlString = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=Gdi6QC1MZQS0SDSMcSP4dS5NxL5GAKQl"
      let url = URL(string: urlString)!
      let promise = expectation(description: "Status : Ok")
      let dataTask = sut.dataTask(with: url) { _, response, error in
        if let error = error {
          XCTFail("Error: \(error.localizedDescription)")
          return
        } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
          if statusCode == 200 {
            promise.fulfill()
          } else {
            XCTFail("Status code: \(statusCode)")
          }
        }
      }
      dataTask.resume()
      wait(for: [promise], timeout: 5)
    }
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
