import Alamofire
import SwiftyJSON

public class DigitalTaxInvoice: ConcurObject {
  
  private(set) public var ConcurReceiptID: String!
  private(set) public var ID: String!
  private(set) public var URI: String!
  private(set) public var AccountID: String!
  private(set) public var DocumentID: String!
  private(set) public var ReceiptData: String!
  
  private init(concurReceiptId: String!, id: String!, uri: String!, accountId: String!, documentId: String!, receiptData: String!) {
    self.ConcurReceiptID = concurReceiptId
    self.ID = id
    self.URI = uri
    self.AccountID = accountId
    self.DocumentID = documentId
    self.ReceiptData = receiptData
  }
  
  public required convenience init(json: JSON) {
    self.init(concurReceiptId: json["ConcurReceiptID"].string, id: json["ID"].string, uri: json["URI"].string, accountId: json["AccountID"].string, documentId: json["DocumentID"].string, receiptData: json["ReceiptData"].string)
  }
  
}

public extension ConcurClient {
  
  public func digitalTaxInvoicesGet(options: [String : AnyObject?], callback: (_ error: String!, _ returnValue: ConcurCollection<DigitalTaxInvoice>!) -> Void) {
    let request = ConcurClient.getHTTPRequest(endpoint: "api/v3.0/expense/digitaltaxinvoices", options: options)
    ConcurClient.sendRequest(request: request, callback: callback)
  }
  
  public func digitalTaxInvoicesPut(options: [String : AnyObject?], callback: (_ error: String!, _ returnValue: ConcurCollection<DigitalTaxInvoice>!) -> Void) {
    let request = ConcurClient.putHTTPRequest(endpoint: "api/v3.0/expense/digitaltaxinvoices", options: options)
    ConcurClient.sendRequest(request: request, callback: callback)
  }
  
}
