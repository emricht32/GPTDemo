//
//  GPTDemoUITestsLaunchTests.swift
//  GPTDemoUITests
//
//  Created by Jonathan Emrich on 2/10/24.
//

import XCTest

final class GPTDemoUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    /// This test verifies that the app launches correctly and reaches its initial state without issues.
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Navigate through any initial screens or dismiss modals before taking a screenshot.
        // For example, if there's an onboarding screen, simulate actions to dismiss it.
        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
