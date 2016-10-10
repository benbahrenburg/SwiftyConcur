import Alamofire
import SwiftyJSON

public class ConnectionRequest: ConcurObject {
  
  private(set) public var FirstName: String!
  private(set) public var ID: String!
  private(set) public var LastModified: String!
  private(set) public var LastName: String!
  private(set) public var LoyaltyNumber: String!
  private(set) public var MiddleName: String!
  private(set) public var RequestToken: String!
  private(set) public var Status: String!
  private(set) public var URI: String!
  
  private init(firstName: String!, id: String!, lastModified: String!, lastName: String!, loyaltyNumber: String!, middleName: String!, requestToken: String!, status: String!, uri: String!) {
    self.FirstName = firstName
    self.ID = id
    self.LastModified = lastModified
    self.LastName = lastName
    self.LoyaltyNumber = loyaltyNumber
    self.MiddleName = middleName
    self.RequestToken = requestToken
    self.Status = status
    self.URI = uri
  }
  
  public required convenience init(json: JSON) {
    self.init(firstName: json["FirstName"].string, id: json["ID"].string, lastModified: json["LastModified"].string, lastName: json["LastName"].string, loyaltyNumber: json["LoyaltyNumber"].string, middleName: json["MiddleName"].string, requestToken: json["RequestToken"].string, status: json["Status"].string, uri: json["URI"].string)
  }
  
}

public extension ConcurClient {
  
  public func connectionRequestsGet(options: [String : AnyObject?], callback: (_ error: String, _ returnValue: ConcurCollection<ConnectionRequest>) -> Void) {
    if let request = ConcurClient.getHTTPRequest(endpoint: "api/v3.0/common/connectionrequests", options: options) {
      ConcurClient.sendRequest(request: request, callback: callback)
    }
  }
  
  public func connectionRequestsPost(options: [String : AnyObject?], callback: (_ error: String, _ returnValue: ConcurCollection<ConnectionRequest>) -> Void) {
    if let request = ConcurClient.postHTTPRequest(endpoint: "api/v3.0/common/connectionrequests", options: options) {
      ConcurClient.sendRequest(request: request, callback: callback)
    }
  }
  
  public func connectionRequestsPut(options: [String : AnyObject?], callback: (_ error: String, _ returnValue: ConcurCollection<ConnectionRequest>) -> Void) {
    if let request = ConcurClient.putHTTPRequest(endpoint: "api/v3.0/common/connectionrequests", options: options) {
      ConcurClient.sendRequest(request: request, callback: callback)
    }
  }
  
  public func connectionRequestsDelete(options: [String : AnyObject?], callback: (_ error: String, _ returnValue: ConcurCollection<ConnectionRequest>) -> Void) {
    if let request = ConcurClient.deleteHTTPRequest(endpoint: "api/v3.0/common/connectionrequests", options: options) {
      ConcurClient.sendRequest(request: request, callback: callback)
    }
  }
  
}
