import XCTest
import SwiftyConcur
import OHHTTPStubs

class UtilitiesTests: XCTestCase {
  
  var client: ConcurClient!
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
    OHHTTPStubs.setEnabled(true)
    self.client = ConcurClient(consumerKey: "KEY", consumerSecret: "SECRET")
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    OHHTTPStubs.removeAllStubs()
    super.tearDown()
  }
  
  func testGetAccessTokenSuccess() {
    let expectation = expectationWithDescription("should return access token")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      // Check Headers
      let headers: [String : String] = request.allHTTPHeaderFields as! [String : String]
      if headers["Authorization"] == nil {
        return false
      }
      if headers["X-ConsumerKey"] == nil {
        return false
      }
      if headers["Accept"] != "application/json" {
        return false
      }
      if headers["User-Agent"] != "SwiftyConcur" {
        return false
      }
      if headers["Content-Type"] != "application/json" {
        return false
      }
      // URL
      // Method
      return true
    }) { _ in
      let error : NSError?
      let response = [
        "Access_Token" : [
          "Expiration_date" : "7/17/2016 9:59:11 PM",
          "Instance_Url" : "https://www.concursolutions.com/",
          "Refresh_Token" : "REFRESH",
          "Token" : "TOKEN"
        ]
      ]
      return OHHTTPStubsResponse(JSONObject: response, statusCode: 200, headers: nil)
    }
    self.client.getNativeFlowAccessToken("USERNAME", password: "PASSWORD", callback: { (error, token) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(5, handler: nil)
  }
  
}