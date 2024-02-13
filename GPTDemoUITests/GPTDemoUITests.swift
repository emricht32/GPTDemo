//
//  GPTDemoUITests.swift
//  GPTDemoUITests
//
//  Created by Jonathan Emrich on 2/10/24.
//

import XCTest

final class GPTDemoUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /// This UI test verifies that the app's UI elements are present and interactable upon launch,
    /// specifically ensuring that a text input field for sending prompts to ChatGPT is available and enabled.
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Verifying that the text input field for sending prompts to ChatGPT is present and enabled.
        let promptTextField = app.textFields["promptTextField"]
        XCTAssertTrue(promptTextField.exists, "Text input field for ChatGPT prompts should exist.")
        XCTAssertTrue(promptTextField.isEnabled, "Text input field for ChatGPT prompts should be enabled.")

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
