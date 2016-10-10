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
  
  public func attendeeTypesGet(options: [String : AnyObject?]) -> (error: String!, returnValue: ConcurCollection<AttendeeType>!) {
    if let request = ConcurClient.getHTTPRequest(endpoint: "api/v3.0/expense/attendeetypes", options: options) {
      return ConcurClient.sendRequest(request: request)
    }
  }
  
  public func attendeeTypesPost(options: [String : AnyObject?]) -> (error: String!, returnValue: ConcurCollection<AttendeeType>!) {
    if let request = ConcurClient.postHTTPRequest(endpoint: "api/v3.0/expense/attendeetypes", options: options) {
      return ConcurClient.sendRequest(request: request)
    }
  }
  
  public func attendeeTypesPut(options: [String : AnyObject?]) -> (error: String!, returnValue: ConcurCollection<AttendeeType>!) {
    if let request = ConcurClient.putHTTPRequest(endpoint: "api/v3.0/expense/attendeetypes", options: options) {
      return ConcurClient.sendRequest(request: request)
    }
  }
  
  public func attendeeTypesDelete(options: [String : AnyObject?]) -> (error: String!, returnValue: ConcurCollection<AttendeeType>!) {
    if let request = ConcurClient.deleteHTTPRequest(endpoint: "api/v3.0/expense/attendeetypes", options: options) {
      return ConcurClient.sendRequest(request: request)
    }
  }
  
}
