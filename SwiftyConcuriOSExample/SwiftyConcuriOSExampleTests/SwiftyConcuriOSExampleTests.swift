import XCTest
import SwiftyConcur

class SwiftyConcuriOSExampleTests: XCTestCase {
  
  var concurClient: ConcurClient!
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // Insert a Consumer Key and Consumer Secret here to test
    var client = ConcurClient(consumerKey: "", consumerSecret: "")
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
    
  func testExample() {
      // This is an example of a functional test case.
      XCTAssert(true, "Pass")
  }
  
  func testCreateQuickExpense() {
    XCTAssertNil(nil, "Pass")
  }
    
}
