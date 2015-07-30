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
  
  public func connectionRequestsGet(options: [String : AnyObject?], callback: (error: String!, returnValue: AnyObject!) -> Void) {
    if self.AccessToken != nil {
      let request = ConcurClient.getHTTPRequest("api/v3.0/common/connectionrequests", options: options)
      Alamofire.request(request).responseJSON { (req, res, json, error) in
        var jsonObject = JSON(json!)
        if let error = jsonObject["Error"]["Message"].string {
          callback(error: error, returnValue: nil)
        } else if let error = jsonObject["Message"].string {
          callback(error: error, returnValue: nil)
        } else {
          var connectionRequests = ConcurCollection<ConnectionRequest>(json: jsonObject)
          callback(error: nil, returnValue: connectionRequests)
        }
      }
    } else {
      callback(error: "Access Token Missing", returnValue: nil)
    }
  }
  
  public func connectionRequestsPost(options: [String : AnyObject?], callback: (error: String!, returnValue: AnyObject!) -> Void) {
    if self.AccessToken != nil {
      let request = ConcurClient.postHTTPRequest("api/v3.0/common/connectionrequests", options: options)
      Alamofire.request(request).responseJSON { (req, res, json, error) in
        let jsonObject = JSON(json!)
        if let error = jsonObject["Error"]["Message"].string {
          callback(error: error, returnValue: nil)
        } else if let error = jsonObject["Message"].string {
          callback(error: error, returnValue: nil)
        } else {
          var connectionRequest = ConnectionRequest(json: jsonObject)
          callback(error: nil, returnValue: connectionRequest)
        }
      }
    } else {
      callback(error: "Access Token Missing", returnValue: nil)
    }
  }
  
  public func connectionRequestsPut(options: [String : AnyObject?], callback: (error: String!) -> Void) {
    if self.AccessToken != nil {
      let request = ConcurClient.putHTTPRequest("api/v3.0/common/connectionrequests", options: options)
      Alamofire.request(request).responseJSON { (req, res, json, error) in
        if json != nil {
          let jsonObject = JSON(json!)
          if let error = jsonObject["Error"]["Message"].string {
            callback(error: error)
          } else if let error = jsonObject["Message"].string {
            callback(error: error)
          } else {
            callback(error: nil)
          }
        } else {
          callback(error: error?.description)
        }
      }
    } else {
      callback(error: "Access Token Missing")
    }
  }
  
  public func connectionRequestsDelete(options: [String : AnyObject?], callback: (error: String!) -> Void) {
    if self.AccessToken != nil {
      let request = ConcurClient.deleteHTTPRequest("api/v3.0/common/connectionrequests", options: options)
      Alamofire.request(request).responseJSON { (req, res, json, error) in
        if json != nil {
          let jsonObject = JSON(json!)
          if let error = jsonObject["Error"]["Message"].string {
            callback(error: error)
          } else if let error = jsonObject["Message"].string {
            callback(error: error)
          } else {
            callback(error: nil)
          }
        } else {
          callback(error: error?.description)
        }
      }
    } else {
      callback(error: "Access Token Missing")
    }
  }
  
}