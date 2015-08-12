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
    self.client = nil
    super.tearDown()
  }
  
  func testDigitalTaxInvoicesGetRequestMethod() {
    let expectation = expectationWithDescription("should contain GET method")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      if request.HTTPMethod != "GET" {
        return false
      }
      return true
      }) { _ in
        let response : NSMutableDictionary = [
          :
        ]
        return OHHTTPStubsResponse(JSONObject: response, statusCode: 200, headers: nil)
    }
    
    var options : [String : AnyObject?] = [
      :
    ]
    
    self.client.digitalTaxInvoicesGet(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testDigitalTaxInvoicesPutRequestMethod() {
    let expectation = expectationWithDescription("should contain PUT method")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      if request.HTTPMethod != "PUT" {
        return false
      }
      return true
      }) { _ in
        let response : NSMutableDictionary = [
          :
        ]
        return OHHTTPStubsResponse(JSONObject: response, statusCode: 200, headers: nil)
    }
    
    var options : [String : AnyObject?] = [
      :
    ]
    
    self.client.digitalTaxInvoicesPut(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testDigitalTaxInvoicesGetRequestHeaders() {
    let expectation = expectationWithDescription("should contain correct headers for GET request")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      let headers: [String : String] = request.allHTTPHeaderFields as! [String : String]
      if headers["Authorization"] == nil || headers["Accept"] != "application/json" || headers["User-Agent"] != "SwiftyConcur" || headers["Content-Type"] != "application/json" {
        return false
      }
      return true
      }) { _ in
        let response : NSMutableDictionary = [
          :
        ]
        return OHHTTPStubsResponse(JSONObject: response, statusCode: 200, headers: nil)
    }
    
    var options : [String : AnyObject?] = [
      :
    ]
    
    self.client.digitalTaxInvoicesGet(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testDigitalTaxInvoicesPutRequestHeaders() {
    let expectation = expectationWithDescription("should contain correct headers for PUT request")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      let headers: [String : String] = request.allHTTPHeaderFields as! [String : String]
      if headers["Authorization"] == nil || headers["Accept"] != "application/json" || headers["User-Agent"] != "SwiftyConcur" || headers["Content-Type"] != "application/json" {
        return false
      }
      return true
      }) { _ in
        let response : NSMutableDictionary = [
          :
        ]
        return OHHTTPStubsResponse(JSONObject: response, statusCode: 200, headers: nil)
    }
    
    var options : [String : AnyObject?] = [
      :
    ]
    
    self.client.digitalTaxInvoicesPut(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testDigitalTaxInvoicesGetAllRequestURL() {
    let expectation = expectationWithDescription("should create correct URL for GET all request")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      let url = request.URLString
      if url != "https://www.concursolutions.com/api/v3.0/expense/digitaltaxinvoices" {
        return false
      }
      return true
      }) { _ in
        let response : NSMutableDictionary = [
          :
        ]
        return OHHTTPStubsResponse(JSONObject: response, statusCode: 200, headers: nil)
    }
    
    var options : [String : AnyObject?] = [
      :
    ]
    
    self.client.digitalTaxInvoicesGet(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }

  func testDigitalTaxInvoicesGetSingleRequestURL() {
    let expectation = expectationWithDescription("should create correct URL for GET single request")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      let url = request.URLString
      if url != "https://www.concursolutions.com/api/v3.0/expense/digitaltaxinvoices/INVOICEID" {
        return false
      }
      return true
      }) { _ in
        let response : NSMutableDictionary = [
          :
        ]
        return OHHTTPStubsResponse(JSONObject: response, statusCode: 200, headers: nil)
    }
    
    var options : [String : AnyObject?] = [
      "id" : "INVOICEID"
    ]
    
    self.client.digitalTaxInvoicesGet(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testDigitalTaxInvoicesPutRequestURL() {
    let expectation = expectationWithDescription("should create correct URL for PUT request")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      let url = request.URLString
      if url != "https://www.concursolutions.com/api/v3.0/expense/digitaltaxinvoices/INVOICEID" {
        return false
      }
      return true
      }) { _ in
        let response : NSMutableDictionary = [
          :
        ]
        return OHHTTPStubsResponse(JSONObject: response, statusCode: 200, headers: nil)
    }
    
    var options : [String : AnyObject?] = [
      "id" : "INVOICEID",
      "Body" : [
        "Status" : "VALID"
      ]
    ]
    
    self.client.digitalTaxInvoicesPut(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testDigitalTaxInvoicesGetAllRequestParams() {
    let expectation = expectationWithDescription("should create correct parameters for GET all request")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      let url = request.URLString
      if url.rangeOfString("https://www.concursolutions.com/api/v3.0/expense/digitaltaxinvoices") == nil || url.rangeOfString("offset=string") == nil || url.rangeOfString("limit=25") == nil || url.rangeOfString("modifiedafter=string") == nil {
        return false
      }
      return true
      }) { _ in
        let response : NSMutableDictionary = [
          :
        ]
        return OHHTTPStubsResponse(JSONObject: response, statusCode: 200, headers: nil)
    }
    
    var options : [String : AnyObject?] = [
      "Parameters" : [
        "offset" : "string",
        "limit" : "25",
        "modifiedafter" : "string"
      ]
    ]
    
    self.client.digitalTaxInvoicesGet(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testDigitalTaxInvoicesPutRequestBody() {
    let expectation = expectationWithDescription("should create correct body for PUT requests")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      if let bodyData = NSURLProtocol.propertyForKey("BodyData", inRequest: request) as! NSData! {
        var error: NSError?
        let dictionary = NSJSONSerialization.JSONObjectWithData(bodyData, options: NSJSONReadingOptions.allZeros, error: &error) as! [String : AnyObject]
        if dictionary["Status"] as! String == "VALID" {
          return true
        } else {
          return false
        }
      }
      return false
      }) { _ in
        let error : NSError?
        let response : NSMutableDictionary = [
          :
        ]
        return OHHTTPStubsResponse(JSONObject: response, statusCode: 200, headers: nil)
    }
    
    var options : [String : AnyObject?] = [
      "Body" : [
        "Status" : "VALID"
      ],
      "id" : "INVOICEID"
    ]
    
    self.client.digitalTaxInvoicesPut(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testDigitalTaxInvoicesGetAllResponse() {
    let expectation = expectationWithDescription("should obtain correct response for GET all requests")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      return true
      }) { _ in
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
            ]
          ],
          "NextPage" : "PAGEURL"
        ]
        return OHHTTPStubsResponse(JSONObject: response, statusCode: 200, headers: nil)
    }
    
    var options : [String : AnyObject?] = [
      :
    ]
    
    self.client.digitalTaxInvoicesGet(options, callback: { (error, returnVal) in
      if error == nil {
        if returnVal.Items.count == 2 && returnVal.NextPage == "PAGEURL" {
          expectation.fulfill()
        }
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testDigitalTaxInvoicesGetSingleResponse() {
    let expectation = expectationWithDescription("should obtain correct response for GET single requests")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      return true
      }) { _ in
        let response : NSMutableDictionary = [
          "ConcurReceiptID" : "string",
          "AccountID" : "string",
          "DocumentID" : "string",
          "ReceiptData" : "PAGEURL"
        ]
        return OHHTTPStubsResponse(JSONObject: response, statusCode: 200, headers: nil)
    }
    
    var options : [String : AnyObject?] = [
      "id" : "INVOICEID"
    ]
    
    self.client.digitalTaxInvoicesGet(options, callback: { (error, returnVal) in
      if error == nil {
        if returnVal.Items.count == 1 && returnVal.NextPage == nil {
          expectation.fulfill()
        }
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testDigitalTaxInvoicesPutResponse() {
    let expectation = expectationWithDescription("should obtain correct response for GET single requests")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      return true
      }) { _ in
        let response : NSMutableDictionary = [
          :
        ]
        return OHHTTPStubsResponse(JSONObject: response, statusCode: 200, headers: nil)
    }
    
    var options : [String : AnyObject?] = [
      "id" : "INVOICEID"
    ]
    
    self.client.digitalTaxInvoicesPut(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
}