import XCTest
import SwiftyConcur

class NativeFlowTests: XCTestCase {
  
  var concurClient: ConcurClient!
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // Insert Consumer Key and Consumer Secret here
    self.concurClient = ConcurClient(consumerKey: "CONSUMER KEY", consumerSecret: "CONSUMER PASSWORD")
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testGetAccessToken() {
    let expectation = expectationWithDescription("obtain access token using native flow")
    self.concurClient.getNativeFlowAccessToken("USERNAME", password: "PASSWORD", callback: { (error, token) in
      if token != nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(5, handler: nil)
  }
  
}
