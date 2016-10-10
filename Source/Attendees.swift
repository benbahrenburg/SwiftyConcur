import Alamofire
import SwiftyJSON

public class Attendee: ConcurObject {
  
  private(set) public var AttendeeTypeCode: String!
  private(set) public var AttendeeTypeID: String!
  private(set) public var Company: String!
  private(set) public var CurrencyCode: String!
  private(set) public var Custom1: SCCustomField!
  private(set) public var Custom2: SCCustomField!
  private(set) public var Custom3: SCCustomField!
  private(set) public var Custom4: SCCustomField!
  private(set) public var Custom5: SCCustomField!
  private(set) public var Custom6: SCCustomField!
  private(set) public var Custom7: SCCustomField!
  private(set) public var Custom8: SCCustomField!
  private(set) public var Custom9: SCCustomField!
  private(set) public var Custom10: SCCustomField!
  private(set) public var Custom11: SCCustomField!
  private(set) public var Custom12: SCCustomField!
  private(set) public var Custom13: SCCustomField!
  private(set) public var Custom14: SCCustomField!
  private(set) public var Custom15: SCCustomField!
  private(set) public var Custom16: SCCustomField!
  private(set) public var Custom17: SCCustomField!
  private(set) public var Custom18: SCCustomField!
  private(set) public var Custom19: SCCustomField!
  private(set) public var Custom20: SCCustomField!
  private(set) public var Custom21: SCCustomField!
  private(set) public var Custom22: SCCustomField!
  private(set) public var Custom23: SCCustomField!
  private(set) public var Custom24: SCCustomField!
  private(set) public var Custom25: SCCustomField!
  private(set) public var ExternalID: String!
  private(set) public var FirstName: String!
  private(set) public var HasExceptionsPrevYear: Bool!
  private(set) public var HasExceptionsYTD: Bool!
  private(set) public var ID: String!
  private(set) public var LastName: String!
  private(set) public var MiddleInitial: String!
  private(set) public var OwnerLoginID: String!
  private(set) public var OwnerName: String!
  private(set) public var Suffix: String!
  private(set) public var Title: String!
  private(set) public var TotalAmountPrevYear: Double!
  private(set) public var TotalAmountYTD: Double!
  private(set) public var URI: String!
  private(set) public var VersionNumber: Int!
  
  private init(attendeeTypeCode: String!, attendeeTypeId: String!, company: String!, currencyCode: String!, custom1: SCCustomField!, custom2: SCCustomField!, custom3: SCCustomField!, custom4: SCCustomField!, custom5: SCCustomField!, custom6: SCCustomField!, custom7: SCCustomField!, custom8: SCCustomField!, custom9: SCCustomField!, custom10: SCCustomField!, custom11: SCCustomField!, custom12: SCCustomField!, custom13: SCCustomField!, custom14: SCCustomField!, custom15: SCCustomField!, custom16: SCCustomField!, custom17: SCCustomField!, custom18: SCCustomField!, custom19: SCCustomField!, custom20: SCCustomField!, custom21: SCCustomField!, custom22: SCCustomField!, custom23: SCCustomField!, custom24: SCCustomField!, custom25: SCCustomField!, externalId: String!, firstName: String!, hasExceptionsPrevYear: Bool!, hasExceptionsTYD: Bool!, id: String!, lastName: String!, middleInitial: String!, ownerLoginId: String!, ownerName: String!, suffix: String!, title: String!, totalAmountPrevYear: Double!, totalAmountYTD: Double!, uri: String!, versionNumber: Int!) {
    self.AttendeeTypeCode = attendeeTypeCode
    self.AttendeeTypeID = attendeeTypeId
    self.Company = company
    self.CurrencyCode = currencyCode
    self.Custom1 = custom1
    self.Custom2 = custom2
    self.Custom3 = custom3
    self.Custom4 = custom4
    self.Custom5 = custom5
    self.Custom6 = custom6
    self.Custom7 = custom7
    self.Custom8 = custom8
    self.Custom9 = custom9
    self.Custom10 = custom10
    self.Custom11 = custom11
    self.Custom12 = custom12
    self.Custom13 = custom13
    self.Custom14 = custom14
    self.Custom15 = custom15
    self.Custom16 = custom16
    self.Custom17 = custom17
    self.Custom18 = custom18
    self.Custom19 = custom19
    self.Custom20 = custom20
    self.Custom21 = custom21
    self.Custom22 = custom22
    self.Custom23 = custom23
    self.Custom24 = custom24
    self.Custom25 = custom25
    self.ExternalID = externalId
    self.FirstName = firstName
    self.HasExceptionsPrevYear = hasExceptionsPrevYear
    self.HasExceptionsYTD = hasExceptionsTYD
    self.ID = id
    self.LastName = lastName
    self.MiddleInitial = middleInitial
    self.OwnerLoginID = ownerLoginId
    self.OwnerName = ownerName
    self.Suffix = suffix
    self.Title = title
    self.TotalAmountPrevYear = totalAmountPrevYear
    self.TotalAmountYTD = totalAmountYTD
    self.URI = uri
    self.VersionNumber = versionNumber
  }
  
  public required convenience init(json: JSON) {
    self.init(attendeeTypeCode: json["AttendeeTypeCode"].string, attendeeTypeId: json["AttendeeTypeID"].string, company: json["Company"].string, currencyCode: json["CurrencyCode"].string, custom1: SCCustomField(json: json["Custom1"]), custom2: SCCustomField(json: json["Custom2"]), custom3: SCCustomField(json: json["Custom3"]), custom4: SCCustomField(json: json["Custom4"]), custom5: SCCustomField(json: json["Custom5"]), custom6: SCCustomField(json: json["Custom6"]), custom7: SCCustomField(json: json["Custom7"]), custom8: SCCustomField(json: json["Custom8"]), custom9: SCCustomField(json: json["Custom9"]), custom10: SCCustomField(json: json["Custom10"]), custom11: SCCustomField(json: json["Custom11"]), custom12: SCCustomField(json: json["Custom12"]), custom13: SCCustomField(json: json["Custom13"]), custom14: SCCustomField(json: json["Custom14"]), custom15: SCCustomField(json: json["Custom15"]), custom16: SCCustomField(json: json["Custom16"]), custom17: SCCustomField(json: json["Custom17"]), custom18: SCCustomField(json: json["Custom18"]), custom19: SCCustomField(json: json["Custom19"]), custom20: SCCustomField(json: json["Custom20"]), custom21: SCCustomField(json: json["Custom21"]), custom22: SCCustomField(json: json["Custom22"]), custom23: SCCustomField(json: json["Custom23"]), custom24: SCCustomField(json: json["Custom24"]), custom25: SCCustomField(json: json["Custom25"]), externalId: json["ExternalID"].string, firstName: json["FirstName"].string, hasExceptionsPrevYear: json["HasExceptionsPrevYear"].bool, hasExceptionsTYD: json["HasExceptionsYTD"].bool, id: json["ID"].string, lastName: json["LastName"].string, middleInitial: json["MiddleInitial"].string, ownerLoginId: json["OwnerLoginID"].string, ownerName: json["OwnerName"].string, suffix: json["Suffix"].string, title: json["Title"].string, totalAmountPrevYear: json["TotalAmountPrevYear"].double, totalAmountYTD: json["TotalAmountYTD"].double, uri: json["URI"].string, versionNumber: json["VersionNumber"].int)
  }
  
}

public extension ConcurClient {
  
  public func attendeesGet(options: [String : AnyObject?]) -> (error: String?, returnValue: ConcurCollection<Attendee>?) {
    if let request = ConcurClient.getHTTPRequest(endpoint: "api/v3.0/expense/attendees", options: options) {
      return ConcurClient.sendRequest(request: request)
    }
  }
  
  public func attendeesPost(options: [String : AnyObject?]) -> (error: String?, returnValue: ConcurCollection<Attendee>?) {
    if let request = ConcurClient.postHTTPRequest(endpoint: "api/v3.0/expense/attendees", options: options) {
      return ConcurClient.sendRequest(request: request)
    }
  }
  
  public func attendeesPut(options: [String : AnyObject?]) -> (error: String?, returnValue: ConcurCollection<Attendee>?) {
    if let request = ConcurClient.putHTTPRequest(endpoint: "api/v3.0/expense/attendees", options: options) {
      return ConcurClient.sendRequest(request: request)
    }
  }
  
  public func attendeesDelete(options: [String : AnyObject?]) -> (error: String?, returnValue: ConcurCollection<Attendee>?) {
    if let request = ConcurClient.deleteHTTPRequest(endpoint: "api/v3.0/expense/attendees", options: options) {
      return ConcurClient.sendRequest(request: request)
    }
  }
  
}
