//
//  GPTDemoTests.swift
//  GPTDemoTests
//
//  Created by Jonathan Emrich on 2/10/24.
//

import XCTest

final class GPTDemoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /// This test case verifies that the ChatGPT response generator, when provided with a valid prompt, returns a non-null and non-empty response.
    func testChatGPTResponseIsNotNullOrEmpty() throws {
        // Assuming there's a `generateResponse` function that takes a String prompt and returns a String response
        let response = generateResponse("Hello, ChatGPT!")
        XCTAssertNotNil(response, "The response should not be nil.")
        XCTAssertFalse(response.isEmpty, "The response should not be empty.")
    }

    /// This performance test measures the round-trip time for a ChatGPT query to be sent and a response received.
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Sending a ChatGPT request and waiting for the response.
            // Assuming generateResponse function takes a String prompt and returns a String response.
            _ = generateResponse("What's the weather like today?")
            // Put the code you want to measure the time of here.
        }
    }

}
