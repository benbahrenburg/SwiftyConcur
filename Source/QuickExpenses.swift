import Alamofire
import SwiftyJSON

public class QuickExpense: ConcurObject {
  private(set) public var Comment: String! // A comment that describes the expense. Max Length: 2000
  private(set) public var CurrencyCode: String! // The 3-letter ISO 4217 currency code for the expense transaction amount. Example: USD
  private(set) public var ExpenseTypeCode: String! // The code for the expense type in the company's expense management system.
  private(set) public var ExpenseTypeName: String! // The name of the expense type associated with the quick expense.
  private(set) public var ID: String! // The unique identifier of the resource.
  private(set) public var LocationName: String! // The name of the location where the expense was incurred.
  private(set) public var OwnerLoginID: String! // The Concur login ID for the expense owner. Useful for system to system integration when there are expenses for multiple users.
  private(set) public var OwnerName: String! // The first and last name for the expense owner. Useful for system to system integration when there are expenses for multiple users.
  private(set) public var PaymentTypeCode: String! // This element specifies the method of payment for the expense. Format: CASHX = Cash, CPAID = Company Paid, or PENDC = Pending Card Transaction (default)
  private(set) public var ReceiptImageID: String! // The ID of the receipt image associated with this quick expense, if any.
  private(set) public var TransactionAmount: String! // The total amount of the expense in the original currency, with up to three decimal places. Example: 123.654
  private(set) public var TransactionDate: String! // The date the expense was incurred. Format: YYYY-MM-DD
  private(set) public var URI: String! // The URI to the resource.
  private(set) public var VendorDescription: String! // The descriptive text for the vendor for the quick expense. This often matches the Merchant Name found in a credit card transaction. Max Length: 64
  
  private init(comment: String!, currencyCode: String!, expenseTypeCode: String!, expenseTypeName: String!, id: String!, locationName: String!, ownerLoginID: String!, ownerName: String!, paymentTypeCode: String!, receiptImageID: String!, transactionAmount: Double!, transactionDate: String!, uri: String!, vendorDescription: String!) {
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
    if transactionAmount != nil {
      self.TransactionAmount = transactionAmount.toString()
    }
    self.TransactionDate = transactionDate
    self.URI = uri
    self.VendorDescription = vendorDescription
  }
  
  public required convenience init(json: JSON) {
    self.init(comment: json["Comment"].string, currencyCode: json["CurrencyCode"].string, expenseTypeCode: json["ExpenseTypeCode"].string, expenseTypeName: json["ExpenseTypeName"].string, id: json["ID"].string, locationName: json["LocationName"].string, ownerLoginID: json["OwnerLoginID"].string, ownerName: json["OwnerName"].string, paymentTypeCode: json["PaymentTypeCode"].string, receiptImageID: json["ReceiptImageID"].string, transactionAmount: json["TransactionAmount"].double, transactionDate: json["TransactionDate"].string, uri: json["URI"].string, vendorDescription: json["VendorDescription"].string)
  }
  
}

public extension ConcurClient {
  
  public func quickExpensesGet(options: [String : AnyObject?], callback: (_ error: String, _ returnValue: ConcurCollection<QuickExpense>) -> Void) {
    if let request = ConcurClient.getHTTPRequest("api/v3.0/expense/quickexpenses", options: options) {
      ConcurClient.sendRequest(request: request, callback: callback)
    }
  }
  
  public func quickExpensesPost(options: [String : AnyObject?], callback: (_ error: String, _ returnValue: ConcurCollection<QuickExpense>) -> Void) {
    if let request = ConcurClient.postHTTPRequest("api/v3.0/expense/quickexpenses", options: options) {
      ConcurClient.sendRequest(request: request, callback: callback)
    }
  }
  
  public func quickExpensesPut(options: [String : AnyObject?], callback: (_ error: String, _ returnValue: ConcurCollection<QuickExpense>) -> Void) {
    if let request = ConcurClient.putHTTPRequest("api/v3.0/expense/quickexpenses", options: options) {
      ConcurClient.sendRequest(request: request, callback: callback)
    }
  }
  
  public func quickExpensesDelete(options: [String : AnyObject?], callback: (_ error: String, _ returnValue: ConcurCollection<QuickExpense>) -> Void) {
    if let request = ConcurClient.deleteHTTPRequest("api/v3.0/expense/quickexpenses", options: options) {
      ConcurClient.sendRequest(request: request, callback: callback)
    }
  }
  
}
