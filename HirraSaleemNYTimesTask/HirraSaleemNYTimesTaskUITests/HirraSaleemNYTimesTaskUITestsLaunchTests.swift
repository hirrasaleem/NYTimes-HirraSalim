//
//  HirraSaleemNYTimesTaskUITestsLaunchTests.swift
//  HirraSaleemNYTimesTaskUITests
//
//  Created by Hirra on 22/01/2022.
//

import XCTest

class HirraSaleemNYTimesTaskUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "HeaderView"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
