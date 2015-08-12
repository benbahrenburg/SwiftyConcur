import XCTest
import SwiftyConcur
import OHHTTPStubs

class EntryAttendeeAssociationsTests: XCTestCase {
  
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
  
  func testEntryAttendeeAssociationsGetRequestMethod() {
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
    
    self.client.entryAttendeeAssociationGet(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testEntryAttendeeAssociationsPostRequestMethod() {
    let expectation = expectationWithDescription("should contain POST method")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      if request.HTTPMethod != "POST" {
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
    
    self.client.entryAttendeeAssociationPost(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testEntryAttendeeAssociationsPutRequestMethod() {
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
    
    self.client.entryAttendeeAssociationPut(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testEntryAttendeeAssociationsDeleteRequestMethod() {
    let expectation = expectationWithDescription("should contain DELETE method")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      if request.HTTPMethod != "DELETE" {
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
    
    self.client.entryAttendeeAssociationDelete(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testEntryAttendeeAssociationsGetRequestHeaders() {
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
    
    self.client.entryAttendeeAssociationGet(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testEntryAttendeeAssociationsPostRequestHeaders() {
    let expectation = expectationWithDescription("should contain correct headers for POST request")
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
    
    self.client.entryAttendeeAssociationPost(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }

  func testEntryAttendeeAssociationsPutRequestHeaders() {
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
    
    self.client.entryAttendeeAssociationPut(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testEntryAttendeeAssociationsDeleteRequestHeaders() {
    let expectation = expectationWithDescription("should contain correct headers for DELETE request")
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
    
    self.client.entryAttendeeAssociationDelete(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testEntryAttendeeAssociationsGetAllRequestURL() {
    let expectation = expectationWithDescription("should create correct URL for GET all request")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      let url = request.URLString
      if url != "https://www.concursolutions.com/api/v3.0/expense/entryattendeeassociations" {
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
    
    self.client.entryAttendeeAssociationGet(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testEntryAttendeeAssociationsGetSingleRequestURL() {
    let expectation = expectationWithDescription("should create correct URL for GET single request")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      let url = request.URLString
      if url != "https://www.concursolutions.com/api/v3.0/expense/entryattendeeassociations/ASSOCIATIONID" {
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
      "id" : "ASSOCIATIONID"
    ]
    
    self.client.entryAttendeeAssociationGet(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testEntryAttendeeAssociationsPostRequestURL() {
    let expectation = expectationWithDescription("should create correct URL for POST request")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      let url = request.URLString
      if url != "https://www.concursolutions.com/api/v3.0/expense/entryattendeeassociations" {
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
    
    self.client.entryAttendeeAssociationPost(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testEntryAttendeeAssociationsPutRequestURL() {
    let expectation = expectationWithDescription("should create correct URL for PUT request")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      let url = request.URLString
      if url != "https://www.concursolutions.com/api/v3.0/expense/entryattendeeassociations/ASSOCIATIONID" {
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
      "id" : "ASSOCIATIONID"
    ]
    
    self.client.entryAttendeeAssociationPut(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testEntryAttendeeAssociationsDeleteRequestURL() {
    let expectation = expectationWithDescription("should create correct URL for DELETE request")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      let url = request.URLString
      if url != "https://www.concursolutions.com/api/v3.0/expense/entryattendeeassociations/ASSOCIATIONID" {
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
      "id" : "ASSOCIATIONID"
    ]
    
    self.client.entryAttendeeAssociationDelete(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testEntryAttendeeAssociationsGetAllRequestParams() {
    let expectation = expectationWithDescription("should create correct parameters for GET all request")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      let url = request.URLString
      if url.rangeOfString("https://www.concursolutions.com/api/v3.0/expense/entryattendeeassociations") == nil || url.rangeOfString("offset=string") == nil || url.rangeOfString("limit=25") == nil || url.rangeOfString("entryID=string") == nil || url.rangeOfString("user=string") == nil {
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
        "entryID" : "string",
        "user" : "string"
      ]
    ]
    
    self.client.entryAttendeeAssociationGet(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testEntryAttendeeAssociationsGetSingleRequestParams() {
    let expectation = expectationWithDescription("should create correct parameters for GET single request")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      let url = request.URLString
      if url.rangeOfString("https://www.concursolutions.com/api/v3.0/expense/entryattendeeassociations/ASSOCIATIONID") == nil || url.rangeOfString("user=string") == nil {
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
        "user" : "string"
      ],
      "id" : "ASSOCIATIONID"
    ]
    
    self.client.entryAttendeeAssociationGet(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testEntryAttendeeAssociationsPostRequestParams() {
    let expectation = expectationWithDescription("should create correct parameters for POST request")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      let url = request.URLString
      if url.rangeOfString("https://www.concursolutions.com/api/v3.0/expense/entryattendeeassociations") == nil || url.rangeOfString("user=string") == nil {
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
        "user" : "string"
      ]
    ]
    
    self.client.entryAttendeeAssociationPost(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testEntryAttendeeAssociationsPutRequestParams() {
    let expectation = expectationWithDescription("should create correct parameters for PUT request")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      let url = request.URLString
      if url.rangeOfString("https://www.concursolutions.com/api/v3.0/expense/entryattendeeassociations/ASSOCIATIONID") == nil || url.rangeOfString("user=string") == nil {
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
        "user" : "string"
      ],
      "id" : "ASSOCIATIONID"
    ]
    
    self.client.entryAttendeeAssociationPut(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testEntryAttendeeAssociationsDeleteRequestParams() {
    let expectation = expectationWithDescription("should create correct parameters for DELETE request")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      let url = request.URLString
      if url.rangeOfString("https://www.concursolutions.com/api/v3.0/expense/entryattendeeassociations/ASSOCIATIONID") == nil || url.rangeOfString("user=string") == nil {
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
        "user" : "string"
      ],
      "id" : "ASSOCIATIONID"
    ]
    
    self.client.entryAttendeeAssociationDelete(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testEntryAttendeeAssociationsPostRequestBody() {
    let expectation = expectationWithDescription("should create correct body for POST requests")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      if let bodyData = NSURLProtocol.propertyForKey("BodyData", inRequest: request) as! NSData! {
        var error: NSError?
        let dictionary = NSJSONSerialization.JSONObjectWithData(bodyData, options: NSJSONReadingOptions.allZeros, error: &error) as! [String : AnyObject]
        if dictionary["Amount"] as! String == "double" && dictionary["AssociatedAttendeeCount"] as! String == "int" && dictionary["AttendeeID"] as! String == "string" && dictionary["Custom1"] as! String == "string" && dictionary["Custom2"] as! String == "string" && dictionary["Custom3"] as! String == "string" && dictionary["Custom4"] as! String == "string" && dictionary["Custom5"] as! String == "string" && dictionary["EntryID"] as! String == "string" {
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
        "Amount" : "double",
        "AssociatedAttendeeCount" : "int",
        "AttendeeID" : "string",
        "Custom1" : "string",
        "Custom2" : "string",
        "Custom3" : "string",
        "Custom4" : "string",
        "Custom5" : "string",
        "EntryID" : "string"
      ]
    ]
    
    self.client.entryAttendeeAssociationPost(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
}