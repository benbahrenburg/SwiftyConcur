import XCTest
import SwiftyConcur
import OHHTTPStubs

class NativeFlowTests: XCTestCase {
  
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
  
  func testNativeFlowHeadersRequest() {
    let expectation = expectationWithDescription("should contain correct headers")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      // Check headers for existence and correctness
      let headers: [String : String] = request.allHTTPHeaderFields as! [String : String]
      if headers["Authorization"] == nil || headers["X-ConsumerKey"] == nil || headers["Accept"] != "application/json" || headers["User-Agent"] != "SwiftyConcur" || headers["Content-Type"] != "application/json" {
        return false
      }
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
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testNativeFlowURLRequest() {
    let expectation = expectationWithDescription("should contain correct url")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      // Check URL for existence and correctness
      if request.URL!.absoluteString != "https://www.concursolutions.com/net2/oauth2/accesstoken.ashx" {
        return false
      }
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
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testNativeFlowMethodRequest() {
    let expectation = expectationWithDescription("should contain correct method")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      // Check method for existence and correctness
      if request.HTTPMethod != "GET" {
        return false
      }
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
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testNativeFlowResponse() {
    let expectation = expectationWithDescription("should contain correct response")
    OHHTTPStubs.stubRequestsPassingTest({ _ in
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
        if token.Token == "TOKEN" && token.RefreshToken == "REFRESH" && token.InstanceUrl == "https://www.concursolutions.com/" && token.ExpirationDate == "7/17/2016 9:59:11 PM" {
          expectation.fulfill()
        }
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
}