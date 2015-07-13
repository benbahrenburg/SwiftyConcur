import Alamofire
import SwiftyJSON

public class QuickExpense {
  public var Comment: String! // A comment that describes the expense. Max Length: 2000
  public var CurrencyCode: String // The 3-letter ISO 4217 currency code for the expense transaction amount. Example: USD
  public var ExpenseTypeCode: String! // The code for the expense type in the company's expense management system.
  public var ExpenseTypeName: String! // The name of the expense type associated with the quick expense.
  public var ID: String! // The unique identifier of the resource.
  public var LocationName: String! // The name of the location where the expense was incurred.
  public var OwnerLoginID: String! // The Concur login ID for the expense owner. Useful for system to system integration when there are expenses for multiple users.
  public var OwnerName: String! // The first and last name for the expense owner. Useful for system to system integration when there are expenses for multiple users.
  public var PaymentTypeCode: String! // This element specifies the method of payment for the expense. Format: CASHX = Cash, CPAID = Company Paid, or PENDC = Pending Card Transaction (default)
  public var ReceiptImageID: String! // The ID of the receipt image associated with this quick expense, if any.
  public var TransactionAmount: String // The total amount of the expense in the original currency, with up to three decimal places. Example: 123.654
  public var TransactionDate: String // The date the expense was incurred. Format: YYYY-MM-DD
  public var URI: String! // The URI to the resource.
  public var VendorDescription: String! // The descriptive text for the vendor for the quick expense. This often matches the Merchant Name found in a credit card transaction. Max Length: 64
  
  public init(comment: String!, currencyCode: String, expenseTypeCode: String!, expenseTypeName: String!, id: String!, locationName: String!, ownerLoginID: String!, ownerName: String!, paymentTypeCode: String!, receiptImageID: String!, transactionAmount: String, transactionDate: String, uri: String!, vendorDescription: String!) {
    self.Comment = comment
    self.CurrencyCode = currencyCode
    self.ExpenseTypeCode = expenseTypeCode
    self.ExpenseTypeName = expenseTypeName
    self.ID = id
    self.LocationName = locationName
    self.OwnerLoginID = ownerLoginID
    self.OwnerName = ownerName
    self.PaymentTypeCode = paymentTypeCode
    self.ReceiptImageID = receiptImageID
    self.TransactionAmount = transactionAmount
    self.TransactionDate = transactionDate
    self.URI = uri
    self.VendorDescription = vendorDescription
  }
  
  public convenience init(json: JSON) {
    self.init(comment: json["Comment"].string, currencyCode: json["CurrencyCode"].string!, expenseTypeCode: json["ExpenseTypeCode"].string, expenseTypeName: json["ExpenseTypeName"].string, id: json["ID"].string, locationName: json["LocationName"].string, ownerLoginID: json["OwnerLoginID"].string, ownerName: json["OwnerName"].string, paymentTypeCode: json["PaymentTypeCode"].string, receiptImageID: json["ReceiptImageID"].string, transactionAmount: json["TransactionAmount"].double!.toString(), transactionDate: json["TransactionDate"].string!, uri: json["URI"].string, vendorDescription: json["VendorDescription"].string)
  }
  
}

public extension ConcurClient {
  
  public func getAllQuickExpense(parameters: [String : String]!, callback: (error: String!, expenses: [QuickExpense]!, nextPage: String!) -> Void) {
    if self.accessToken != nil {
      var extraHeaders = [
        "Authorization" : self.getAuthString()
      ]
      let request = Utilities.createHTTPRequest("/api/v3.0/expense/quickexpenses", headers: Utilities.buildHeaders(extraHeaders), method: "GET", body: nil)
      Alamofire.ParameterEncoding.URL.encode(request, parameters: parameters)
      Alamofire.request(request).responseJSON { (req, res, json, error) in
        var jsonObject = JSON(json!)
        if let error = jsonObject["Message"].string {
          callback(error: error, expenses: nil, nextPage: nil)
        } else {
          var expenses: [QuickExpense] = []
          for (index: String, subJson: JSON) in jsonObject["Items"] {
            var expense = QuickExpense(json: subJson)
            expenses.append(expense)
          }
          callback(error: nil, expenses: expenses, nextPage: jsonObject["NextPage"].string)
        }
      }
    } else {
      callback(error: "Access Token Needed", expenses: nil, nextPage: nil)
    }
  }
  
  public func getQuickExpenseById(id: String, parameters: [String : String]!, callback: (error: String!, expense: QuickExpense!) -> Void) {
    if self.accessToken != nil {
      var extraHeaders = [
        "Authorization" : self.getAuthString()
      ]
      let request = Utilities.createHTTPRequest("/api/v3.0/expense/quickexpenses/".stringByAppendingString(id), headers: Utilities.buildHeaders(extraHeaders), method: "GET", body: nil)
      Alamofire.ParameterEncoding.URL.encode(request, parameters: parameters)
      Alamofire.request(request).responseJSON { (req, res, json, error) in
        var jsonObject = JSON(json!)
        if let error = jsonObject["Message"].string {
          callback(error: error, expense: nil)
        } else {
          var expense = QuickExpense(json: jsonObject)
          callback(error: nil, expense: expense)
        }
      }
    } else {
      callback(error: "Access Token Needed", expense: nil)
    }
  }
  
  public func createQuickExpense(currencyCode: String, transactionAmount: String, transactionDate: String, additionalParameters: [String : String]!, callback: (error: String!, id: String!, uri: String!) -> Void) {
    if self.accessToken != nil {
      var extraHeaders = [
        "Authorization" : self.getAuthString()
      ]
      var bodyJSON = NSMutableDictionary()
      if additionalParameters != nil {
        for (key, value) in additionalParameters {
          bodyJSON.setObject(value, forKey: key)
        }
      }
      bodyJSON.setObject(currencyCode, forKey: "CurrencyCode")
      bodyJSON.setObject(transactionAmount, forKey: "TransactionAmount")
      bodyJSON.setObject(transactionDate, forKey: "TransactionDate")
      var error: NSError?
      var bodyData = NSJSONSerialization.dataWithJSONObject(bodyJSON, options: NSJSONWritingOptions.allZeros, error: &error)
      let request = Utilities.createHTTPRequest("/api/v3.0/expense/quickexpenses", headers: Utilities.buildHeaders(extraHeaders), method: "POST", body: bodyData)
      Alamofire.request(request).responseJSON { (req, res, json, error) in
        let jsonObject = JSON(json!)
        if let error = jsonObject["Message"].string {
          callback(error: error, id: nil, uri: nil)
        } else {
          callback(error: nil, id: jsonObject["ID"].string, uri: jsonObject["URI"].string)
        }
      }
    } else {
      callback(error: "Access Token Needed", id: nil, uri: nil)
    }
  }
  
  public func updateQuickExpenseById(id: String, parameters: [String : String], callback: (error: String!) -> Void) {
    if self.accessToken != nil {
      var extraHeaders = [
        "Authorization" : self.getAuthString()
      ]
      var bodyJSON = NSMutableDictionary()
      for (key, value) in parameters {
        bodyJSON.setObject(value, forKey: key)
      }
      var error: NSError?
      var bodyData = NSJSONSerialization.dataWithJSONObject(bodyJSON, options: NSJSONWritingOptions.allZeros, error: &error)
      let request = Utilities.createHTTPRequest("/api/v3.0/expense/quickexpenses/".stringByAppendingString(id), headers: Utilities.buildHeaders(extraHeaders), method: "PUT", body: bodyData)
      Alamofire.request(request).responseJSON { (req, res, json, error) in
        if json != nil {
          let jsonObject = JSON(json!)
          if let error = jsonObject["Message"].string {
            callback(error: error)
          }
        } else {
          callback(error: nil)
        }
      }
    } else {
      callback(error: "Access Token Needed")
    }
  }
  
  public func deleteQuickExpenseById(id: String, parameters: [String : String]!, callback: (error: String!) -> Void) {
    if self.accessToken != nil {
      var extraHeaders = [
        "Authorization" : self.getAuthString()
      ]
      let request = Utilities.createHTTPRequest("/api/v3.0/expense/quickexpenses/".stringByAppendingString(id), headers: Utilities.buildHeaders(extraHeaders), method: "DELETE", body: nil)
      Alamofire.ParameterEncoding.URL.encode(request, parameters: parameters)
      Alamofire.request(request).responseJSON { (req, res, json, error) in
        if json != nil {
          let jsonObject = JSON(json!)
          if let error = jsonObject["Message"].string {
            callback(error: error)
          }
        } else {
          callback(error: nil)
        }
      }
    } else {
      callback(error: "Access Token Needed")
    }
  }
  
}