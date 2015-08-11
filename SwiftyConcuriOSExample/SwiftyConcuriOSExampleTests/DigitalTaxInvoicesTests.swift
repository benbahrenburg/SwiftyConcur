import XCTest
import SwiftyConcur
import OHHTTPStubs

class DigitalTaxInvoicesTests: XCTestCase {
  
  var client: ConcurClient!
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
    OHHTTPStubs.setEnabled(true)
    self.client = ConcurClient(consumerKey: "KEY", consumerSecret: "SECRET", accessToken: ConcurAccessToken(accessTokenString: "TOKEN"))
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    OHHTTPStubs.removeAllStubs()
    super.tearDown()
  }
  
  func testDigitalTaxInvoicesGetAll() {
    let expectation = expectationWithDescription("should get all DigitalTaxInvoices")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      
      // Check Request Headers
      let headers: [String : String] = request.allHTTPHeaderFields as! [String : String]
      if headers["Authorization"] == nil || headers["Accept"] != "application/json" || headers["User-Agent"] != "SwiftyConcur" || headers["Content-Type"] != "application/json" {
        return false
      }
      
      // Check Request URL and query parameters
      let url = request.URLString
      if url.rangeOfString("https://www.concursolutions.com/api/v3.0/expense/digitaltaxinvoices?") == nil || url.rangeOfString("limit=25") == nil || url.rangeOfString("offset=string") == nil || url.rangeOfString("modifiedafter=string") == nil {
        return false
      }
      
      return true
      }) { _ in
        let error : NSError?
        let response : NSMutableDictionary = [
          "Items" : [
            [
              "ConcurReceiptID" : "string",
              "ID" : "string",
              "URI" : "string"
            ],
            [
              "ConcurReceiptID" : "string",
              "ID" : "string",
              "URI" : "string"
            ],
            [
              "ConcurReceiptID" : "string",
              "ID" : "string",
              "URI" : "string"
            ]
          ],
          "NextPage" : "nil"
        ]
        return OHHTTPStubsResponse(JSONObject: response, statusCode: 200, headers: nil)
    }
    
    var options : [String : AnyObject?] = [
      "Parameters" : [
        "limit" : "25",
        "offset" : "string",
        "modifiedafter" : "string"
      ]
    ]
    
    self.client.digitalTaxInvoicesGet(options, callback: { (error, returnVal) in
      if error == nil {
        if returnVal != nil {
          if returnVal.Items.count == 3 {
            expectation.fulfill()
          }
        }
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testDigitalTaxInvoicesGetSingle() {
    let expectation = expectationWithDescription("should get single DigitalTaxInvoices")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      
      // Check Request Headers
      let headers: [String : String] = request.allHTTPHeaderFields as! [String : String]
      if headers["Authorization"] == nil || headers["Accept"] != "application/json" || headers["User-Agent"] != "SwiftyConcur" || headers["Content-Type"] != "application/json" {
        return false
      }
      
      // Check Request URL and query parameters
      let url = request.URLString
      if url != "https://www.concursolutions.com/api/v3.0/expense/digitaltaxinvoices/INVOICEID" {
        return false
      }
      
      return true
      }) { _ in
        let error : NSError?
        let response : NSMutableDictionary = [
          "ConcurReceiptID" : "string",
          "AccountID" : "string",
          "DocumentID" : "string",
          "ReceiptData" : "string"
        ]
        return OHHTTPStubsResponse(JSONObject: response, statusCode: 200, headers: nil)
    }
    
    var options : [String : AnyObject?] = [
      "id" : "INVOICEID"
    ]
    
    self.client.digitalTaxInvoicesGet(options, callback: { (error, returnVal) in
      if error == nil {
        if returnVal != nil {
          if returnVal.Items.count == 1 {
            expectation.fulfill()
          }
        }
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  // TODO: Test PUT request
  
}