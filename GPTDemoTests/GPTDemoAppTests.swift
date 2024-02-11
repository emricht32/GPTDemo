import XCTest
@testable import GPTDemo

final class GPTDemoAppTests: XCTestCase {
    func testGPTDemoAppInitialization() {
        let app = GPTDemoApp()
        XCTAssertNotNil(app, "GPTDemoApp should be able to initialize without errors.")
    }
    
    func testGPTDemoAppHasWindowGroup() {
        let app = GPTDemoApp()
        let scene = app.body as? WindowGroup<ContentView>
        XCTAssertNotNil(scene, "GPTDemoApp's body should be a WindowGroup containing ContentView.")
    }
}
