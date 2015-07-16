import XCTest
import SwiftyConcur

class NativeFlowTests: XCTestCase {
  
  var environmentVariables = NSProcessInfo.processInfo().environment
  var concurClient: ConcurClient!
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // Insert Consumer Key and Consumer Secret here
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testGetAccessToken() {
    
  }
  
}
