import XCTest
import SwiftyConcur
import OHHTTPStubs

class ExpenseGroupConfigurations: XCTestCase {
  
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
  
  func testExpenseGroupConfigurationsGetRequestMethod() {
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
    
    let options : [String : AnyObject?] = [
      :
    ]
    
    self.client.expenseGroupConfigurationsGet(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testExpenseGroupConfigurationsGetRequestHeaders() {
    let expectation = expectationWithDescription("should contain correct headers for GET request")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      let headers: [String : String] = request.allHTTPHeaderFields as [String : String]!
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
    
    let options : [String : AnyObject?] = [
      :
    ]
    
    self.client.expenseGroupConfigurationsGet(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testExpenseGroupConfigurationsGetAllRequestURL() {
    let expectation = expectationWithDescription("should create correct URL for GET all request")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      let url = request.URLString
      if url != "https://www.concursolutions.com/api/v3.0/expense/expensegroupconfigurations" {
        return false
      }
      return true
      }) { _ in
        let response : NSMutableDictionary = [
          :
        ]
        return OHHTTPStubsResponse(JSONObject: response, statusCode: 200, headers: nil)
    }
    
    let options : [String : AnyObject?] = [
      :
    ]
    
    self.client.expenseGroupConfigurationsGet(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testExpenseGroupConfigurationsGetSingleRequestURL() {
    let expectation = expectationWithDescription("should create correct URL for GET single request")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      let url = request.URLString
      if url != "https://www.concursolutions.com/api/v3.0/expense/expensegroupconfigurations/CONFIGID" {
        return false
      }
      return true
      }) { _ in
        let response : NSMutableDictionary = [
          :
        ]
        return OHHTTPStubsResponse(JSONObject: response, statusCode: 200, headers: nil)
    }
    
    let options : [String : AnyObject?] = [
      "id" : "CONFIGID"
    ]
    
    self.client.expenseGroupConfigurationsGet(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testExpenseGroupConfigurationsGetAllRequestParams() {
    let expectation = expectationWithDescription("should create correct parameters for GET all request")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      let url = request.URLString
      if url.rangeOfString("https://www.concursolutions.com/api/v3.0/expense/expensegroupconfigurations") == nil || url.rangeOfString("offset=string") == nil || url.rangeOfString("limit=10") == nil || url.rangeOfString("user=string") == nil {
        return false
      }
      return true
      }) { _ in
        let response : NSMutableDictionary = [
          :
        ]
        return OHHTTPStubsResponse(JSONObject: response, statusCode: 200, headers: nil)
    }
    
    let options : [String : AnyObject?] = [
      "Parameters" : [
        "offset" : "string",
        "limit" : "10",
        "user" : "string"
      ]
    ]
    
    self.client.expenseGroupConfigurationsGet(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testExpenseGroupConfigurationsGetSingleRequestParams() {
    let expectation = expectationWithDescription("should create correct parameters for GET all request")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      let url = request.URLString
      if url.rangeOfString("https://www.concursolutions.com/api/v3.0/expense/expensegroupconfigurations/CONFIGID") == nil || url.rangeOfString("offset=string") == nil || url.rangeOfString("limit=10") == nil || url.rangeOfString("user=string") == nil {
        return false
      }
      return true
      }) { _ in
        let response : NSMutableDictionary = [
          :
        ]
        return OHHTTPStubsResponse(JSONObject: response, statusCode: 200, headers: nil)
    }
    
    let options : [String : AnyObject?] = [
      "Parameters" : [
        "offset" : "string",
        "limit" : "10",
        "user" : "string"
      ],
      "id" : "CONFIGID"
    ]
    
    self.client.expenseGroupConfigurationsGet(options, callback: { (error, returnVal) in
      if error == nil {
        expectation.fulfill()
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testExpenseGroupConfigurationsGetAllResponse() {
    let expectation = expectationWithDescription("should obtain correct response for GET all requests")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      return true
      }) { _ in
        let response : NSMutableDictionary = [
          "Items" : [
            [
              "AllowUserDigitalTaxInvoice" : "bool",
              "AllowUserRegisterYodlee" : "bool",
              "AttendeeListFormID" : "string",
              "AttendeeListFormName" : "string",
              "AttendeeTypes" : [
                [
                  "Code" : "string",
                  "Name" : "string"
                ]
              ],
              "CashAdvance" : [
                "AllowUserCarryBalance" : "bool",
                "AllowUserLinkMultiple" : "bool",
                "AllowUserUpdateExchangeRate" : "bool",
                "Name" : "string",
                "WorkflowID" : "string"
              ],
              "ID" : "string",
              "Name" : "string",
              "PaymentTypes" : [
                [
                  "ID" : "string",
                  "IsDefault" : "bool",
                  "Name" : "string"
                ]
              ],
              "Policies" : [
                [
                  "ExpenseTypes" : [
                    [
                      "Code" : "string",
                      "ExpenseCode" : "string",
                      "Name" : "string"
                    ]
                  ],
                  "ID" : "string",
                  "IsDefault" : "string",
                  "IsInheritable" : "string",
                  "Name" : "string"
                ]
              ],
              "URI" : "string"
            ],
            [
              "AllowUserDigitalTaxInvoice" : "bool",
              "AllowUserRegisterYodlee" : "bool",
              "AttendeeListFormID" : "string",
              "AttendeeListFormName" : "string",
              "AttendeeTypes" : [
                [
                  "Code" : "string",
                  "Name" : "string"
                ]
              ],
              "CashAdvance" : [
                "AllowUserCarryBalance" : "bool",
                "AllowUserLinkMultiple" : "bool",
                "AllowUserUpdateExchangeRate" : "bool",
                "Name" : "string",
                "WorkflowID" : "string"
              ],
              "ID" : "string",
              "Name" : "string",
              "PaymentTypes" : [
                [
                  "ID" : "string",
                  "IsDefault" : "bool",
                  "Name" : "string"
                ]
              ],
              "Policies" : [
                [
                  "ExpenseTypes" : [
                    [
                      "Code" : "string",
                      "ExpenseCode" : "string",
                      "Name" : "string"
                    ]
                  ],
                  "ID" : "string",
                  "IsDefault" : "string",
                  "IsInheritable" : "string",
                  "Name" : "string"
                ]
              ],
              "URI" : "string"
            ]
          ],
          "NextPage" : "PAGEURL"
        ]
        return OHHTTPStubsResponse(JSONObject: response, statusCode: 200, headers: nil)
    }
    
    let options : [String : AnyObject?] = [
      :
    ]
    
    self.client.expenseGroupConfigurationsGet(options, callback: { (error, returnVal) in
      if error == nil {
        if returnVal.Items.count == 2 && returnVal.NextPage == "PAGEURL" {
          expectation.fulfill()
        }
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
  func testExpenseGroupConfigurationsGetSingleResponse() {
    let expectation = expectationWithDescription("should obtain correct response for GET single requests")
    OHHTTPStubs.stubRequestsPassingTest({ request in
      return true
      }) { _ in
        let response : NSMutableDictionary = [
          "AllowUserDigitalTaxInvoice" : "bool",
          "AllowUserRegisterYodlee" : "bool",
          "AttendeeListFormID" : "string",
          "AttendeeListFormName" : "string",
          "AttendeeTypes" : [
            [
              "Code" : "string",
              "Name" : "string"
            ]
          ],
          "CashAdvance" : [
            "AllowUserCarryBalance" : "bool",
            "AllowUserLinkMultiple" : "bool",
            "AllowUserUpdateExchangeRate" : "bool",
            "Name" : "string",
            "WorkflowID" : "string"
          ],
          "ID" : "string",
          "Name" : "string",
          "PaymentTypes" : [
            [
              "ID" : "string",
              "IsDefault" : "bool",
              "Name" : "string"
            ]
          ],
          "Policies" : [
            [
              "ExpenseTypes" : [
                [
                  "Code" : "string",
                  "ExpenseCode" : "string",
                  "Name" : "string"
                ]
              ],
              "ID" : "string",
              "IsDefault" : "string",
              "IsInheritable" : "string",
              "Name" : "string"
            ]
          ],
          "URI" : "string"
        ]
        return OHHTTPStubsResponse(JSONObject: response, statusCode: 200, headers: nil)
    }
    
    let options : [String : AnyObject?] = [
      "id" : "INVOICEID"
    ]
    
    self.client.expenseGroupConfigurationsGet(options, callback: { (error, returnVal) in
      if error == nil {
        if returnVal.Items.count == 1 && returnVal.NextPage == nil {
          expectation.fulfill()
        }
      }
    })
    
    waitForExpectationsWithTimeout(2, handler: nil)
  }
  
}