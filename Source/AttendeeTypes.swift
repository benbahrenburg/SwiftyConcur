import Alamofire
import SwiftyJSON

public class AttendeeType: ConcurObject {
  
  private(set) public var AllowAttendeeCountEditing: Bool!
  private(set) public var AllowManuallyEnteredAttendees: Bool!
  private(set) public var AttendeeFormID: String!
  private(set) public var Code: String!
  private(set) public var ConnectorID: String!
  private(set) public var DuplicateSearchFields: [String]!
  private(set) public var ID: String!
  private(set) public var Name: String!
  private(set) public var URI: String!
  
  private init(allowAttendeeCountEditing: Bool!, allowManuallyEnteredAttendees: Bool!, attendeeFormId: String!, code: String!, connectorId: String!, duplicateSearchFields: [AnyObject]!, id: String!, name: String!, uri: String!) {
    self.AllowAttendeeCountEditing = allowAttendeeCountEditing
    self.AllowManuallyEnteredAttendees = allowManuallyEnteredAttendees
    self.AttendeeFormID = attendeeFormId
    self.Code = code
    self.ConnectorID = connectorId
    if let dupSearchFields = duplicateSearchFields as? [String] {
      self.DuplicateSearchFields = dupSearchFields
    }
    self.ID = id
    self.Name = name
    self.URI = uri
  }
  
  public required convenience init(json: JSON) {
    self.init(allowAttendeeCountEditing: json["AllowAttendeeCountEditing"].bool, allowManuallyEnteredAttendees: json["AllowManuallyEnteredAttendees"].bool, attendeeFormId: json["AttendeeFormID"].string, code: json["Code"].string, connectorId: json["ConnectorID"].string, duplicateSearchFields: json["DuplicateSearchFields"].arrayObject, id: json["ID"].string, name: json["Name"].string, uri: json["URI"].string)
  }
  
}

public extension ConcurClient {
  
  public func attendeeTypesGet(options: [String : AnyObject?], callback: (error: String!, returnValue: AnyObject!) -> Void) {
    if self.AccessToken != nil {
      let request = ConcurClient.getHTTPRequest("/api/v3.0/expense/attendeetypes", options: options)
      Alamofire.request(request).responseJSON { (req, res, json, error) in
        var jsonObject = JSON(json!)
        if let error = jsonObject["Error"]["Message"].string {
          callback(error: error, returnValue: nil)
        } else if let error = jsonObject["Message"].string {
          callback(error: error, returnValue: nil)
        } else {
          var attendeeTypes = ConcurCollection<AttendeeType>(json: jsonObject)
          callback(error: nil, returnValue: attendeeTypes)
        }
      }
    } else {
      callback(error: "Access Token Missing", returnValue: nil)
    }
  }
  
  public func attendeeTypesPost(options: [String : AnyObject?], callback: (error: String!, returnValue: AnyObject!) -> Void) {
    if self.AccessToken != nil {
      let request = ConcurClient.postHTTPRequest("/api/v3.0/expense/attendeetypes", options: options)
      Alamofire.request(request).responseJSON { (req, res, json, error) in
        let jsonObject = JSON(json!)
        if let error = jsonObject["Error"]["Message"].string {
          callback(error: error, returnValue: nil)
        } else if let error = jsonObject["Message"].string {
          callback(error: error, returnValue: nil)
        } else {
          var attendeeType = AttendeeType(json: jsonObject)
          callback(error: nil, returnValue: attendeeType)
        }
      }
    } else {
      callback(error: "Access Token Missing", returnValue: nil)
    }
  }
  
  public func attendeeTypesPut(options: [String : AnyObject?], callback: (error: String!) -> Void) {
    if self.AccessToken != nil {
      let request = ConcurClient.putHTTPRequest("/api/v3.0/expense/attendeetypes", options: options)
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
  
  public func attendeeTypesDelete(options: [String : AnyObject?], callback: (error: String!) -> Void) {
    if self.AccessToken != nil {
      let request = ConcurClient.deleteHTTPRequest("/api/v3.0/expense/attendeetypes", options: options)
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