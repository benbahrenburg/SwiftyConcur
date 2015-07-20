import Alamofire
import SwiftyJSON

public class EntryAttendeeAssociation: ConcurObject {
  
  private(set) public var Amount: Double!
  private(set) public var AssociatedAttendeeCount: Int!
  private(set) public var AttendeeID: String!
  private(set) public var Custom1: String!
  private(set) public var Custom2: String!
  private(set) public var Custom3: String!
  private(set) public var Custom4: String!
  private(set) public var Custom5: String!
  private(set) public var EntryID: String!
  private(set) public var ID: String!
  private(set) public var URI: String!
  
  private init(amount: Double!, associatedAttendeeCount: Int!, attendeeID: String!, custom1: String!, custom2: String!, custom3: String!, custom4: String!, custom5: String!, entryID: String!, id: String!, uri: String!) {
    self.Amount = amount
    self.AssociatedAttendeeCount = associatedAttendeeCount
    self.AttendeeID = attendeeID
    self.Custom1 = custom1
    self.Custom2 = custom2
    self.Custom3 = custom3
    self.Custom4 = custom4
    self.Custom5 = custom5
    self.EntryID = entryID
    self.ID = id
    self.URI = uri
  }
  
  public required convenience init(json: JSON) {
    self.init(amount: json["Amount"].double, associatedAttendeeCount: json["AssociatedAttendeeCount"].int, attendeeID: json["AttendeeID"].string, custom1: json["Custom1"].string, custom2: json["Custom2"].string, custom3: json["Custom3"].string, custom4: json["Custom4"].string, custom5: json["Custom5"].string, entryID: json["EntryID"].string, id: json["ID"].string, uri: json["URI"].string)
  }

}

public extension ConcurClient {
  
  public func entryAttendeeAssociationGet(options: [String : AnyObject?], callback: (error: String!, returnValue: AnyObject!) -> Void) {
    if self.AccessToken != nil {
      let request = ConcurClient.getHTTPRequest("/api/v3.0/expense/entryattendeeassociations", options: options)
      Alamofire.request(request).responseJSON { (req, res, json, error) in
        var jsonObject = JSON(json!)
        if let error = jsonObject["Error"]["Message"].string {
          callback(error: error, returnValue: nil)
        } else if let error = jsonObject["Message"].string {
          callback(error: error, returnValue: nil)
        } else {
          var expenses = ConcurCollection<EntryAttendeeAssociation>(json: jsonObject)
          callback(error: nil, returnValue: expenses)
        }
      }
    } else {
      callback(error: "Access Token Missing", returnValue: nil)
    }
  }
  
  public func entryAttendeeAssociationPost(options: [String : AnyObject?], callback: (error: String!, returnValue: AnyObject!) -> Void) {
    if self.AccessToken != nil {
      let request = ConcurClient.postHTTPRequest("/api/v3.0/expense/entryattendeeassociations", options: options)
      Alamofire.request(request).responseJSON { (req, res, json, error) in
        let jsonObject = JSON(json!)
        if let error = jsonObject["Error"]["Message"].string {
          callback(error: error, returnValue: nil)
        } else if let error = jsonObject["Message"].string {
          callback(error: error, returnValue: nil)
        } else {
          var expense = EntryAttendeeAssociation(json: jsonObject)
          callback(error: nil, returnValue: expense)
        }
      }
    } else {
      callback(error: "Access Token Missing", returnValue: nil)
    }
  }
  
  public func entryAttendeeAssociationPut(options: [String : AnyObject?], callback: (error: String!) -> Void) {
    if self.AccessToken != nil {
      let request = ConcurClient.putHTTPRequest("/api/v3.0/expense/entryattendeeassociations", options: options)
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
  
  public func entryAttendeeAssociationDelete(options: [String : AnyObject?], callback: (error: String!) -> Void) {
    if self.AccessToken != nil {
      let request = ConcurClient.deleteHTTPRequest("/api/v3.0/expense/entryattendeeassociations", options: options)
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