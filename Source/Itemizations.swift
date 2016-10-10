import Alamofire
import SwiftyJSON

public class Itemization: ConcurObject {
  
  private(set) public var AllocationType: String!
  private(set) public var ApprovedAmount: Double!
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
  private(set) public var Custom26: SCCustomField!
  private(set) public var Custom27: SCCustomField!
  private(set) public var Custom28: SCCustomField!
  private(set) public var Custom29: SCCustomField!
  private(set) public var Custom30: SCCustomField!
  private(set) public var Custom31: SCCustomField!
  private(set) public var Custom32: SCCustomField!
  private(set) public var Custom33: SCCustomField!
  private(set) public var Custom34: SCCustomField!
  private(set) public var Custom35: SCCustomField!
  private(set) public var Custom36: SCCustomField!
  private(set) public var Custom37: SCCustomField!
  private(set) public var Custom38: SCCustomField!
  private(set) public var Custom39: SCCustomField!
  private(set) public var Custom40: SCCustomField!
  private(set) public var Description: String!
  private(set) public var EntryID: String!
  private(set) public var ExpenseTypeCode: String!
  private(set) public var ExpenseTypeName: String!
  private(set) public var HasComments: Bool!
  private(set) public var HasExceptions: Bool!
  private(set) public var ID: String!
  private(set) public var IsBillable: Bool!
  private(set) public var IsImageRequired: Bool!
  private(set) public var IsPersonal: Bool!
  private(set) public var LastModified: String!
  private(set) public var LocationCountry: String!
  private(set) public var LocationID: String!
  private(set) public var LocationName: String!
  private(set) public var LocationSubdivision: String!
  private(set) public var OrgUnit1: SCCustomField!
  private(set) public var OrgUnit2: SCCustomField!
  private(set) public var OrgUnit3: SCCustomField!
  private(set) public var OrgUnit4: SCCustomField!
  private(set) public var OrgUnit5: SCCustomField!
  private(set) public var OrgUnit6: SCCustomField!
  private(set) public var PostedAmount: Double!
  private(set) public var ReportID: String!
  private(set) public var ReportOwnerID: String!
  private(set) public var SpendCategoryCode: String!
  private(set) public var SpendCategoryName: String!
  private(set) public var TransactionAmount: Double!
  private(set) public var TransactionDate: String!
  private(set) public var URI: String!
  
  private init(allocationType: String!, approvedAmount: Double!, custom1: SCCustomField!, custom2: SCCustomField!, custom3: SCCustomField!, custom4: SCCustomField!, custom5: SCCustomField!, custom6: SCCustomField!, custom7: SCCustomField!, custom8: SCCustomField!, custom9: SCCustomField!, custom10: SCCustomField!, custom11: SCCustomField!, custom12: SCCustomField!, custom13: SCCustomField!, custom14: SCCustomField!, custom15: SCCustomField!, custom16: SCCustomField!, custom17: SCCustomField!, custom18: SCCustomField!, custom19: SCCustomField!, custom20: SCCustomField!, custom21: SCCustomField!, custom22: SCCustomField!, custom23: SCCustomField!, custom24: SCCustomField!, custom25: SCCustomField!, custom26: SCCustomField!, custom27: SCCustomField!, custom28: SCCustomField!, custom29: SCCustomField!, custom30: SCCustomField!, custom31: SCCustomField!, custom32: SCCustomField!, custom33: SCCustomField!, custom34: SCCustomField!, custom35: SCCustomField!, custom36: SCCustomField!, custom37: SCCustomField!, custom38: SCCustomField!, custom39: SCCustomField!, custom40: SCCustomField!, description: String!, entryId: String!, expenseTypeCode: String!, expenseTypeName: String!, hasComments: Bool!, hasExceptions: Bool!, id: String!, isBillable: Bool!, isImageRequired: Bool!, isPersonal: Bool!, lastModified: String!, locationCountry: String!, locationId: String!, locationName: String!, locationSubdivision: String!, orgUnit1: SCCustomField!, orgUnit2: SCCustomField!, orgUnit3: SCCustomField!, orgUnit4: SCCustomField!, orgUnit5: SCCustomField!, orgUnit6: SCCustomField!, postedAmount: Double!, reportId: String!, reportOwnerId: String!, spendCategoryCode: String!, spendCategoryName: String!, transactionAmount: Double!, transactionDate: String!, uri: String!) {
    self.AllocationType = allocationType
    self.ApprovedAmount = approvedAmount
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
    self.Custom26 = custom26
    self.Custom27 = custom27
    self.Custom28 = custom28
    self.Custom29 = custom29
    self.Custom30 = custom30
    self.Custom31 = custom31
    self.Custom32 = custom32
    self.Custom33 = custom33
    self.Custom34 = custom34
    self.Custom35 = custom35
    self.Custom36 = custom36
    self.Custom37 = custom37
    self.Custom38 = custom38
    self.Custom39 = custom39
    self.Custom40 = custom40
    self.Description = description
    self.EntryID = entryId
    self.ExpenseTypeCode = expenseTypeCode
    self.ExpenseTypeName = expenseTypeName
    self.HasComments = hasComments
    self.HasExceptions = hasExceptions
    self.ID = id
    self.IsBillable = isBillable
    self.IsImageRequired = isImageRequired
    self.IsPersonal = isPersonal
    self.LastModified = lastModified
    self.LocationCountry = locationCountry
    self.LocationID = locationId
    self.LocationName = locationName
    self.LocationSubdivision = locationSubdivision
    self.OrgUnit1 = orgUnit1
    self.OrgUnit2 = orgUnit2
    self.OrgUnit3 = orgUnit3
    self.OrgUnit4 = orgUnit4
    self.OrgUnit5 = orgUnit5
    self.OrgUnit6 = orgUnit6
    self.PostedAmount = postedAmount
    self.ReportID = reportId
    self.ReportOwnerID = reportOwnerId
    self.SpendCategoryCode = spendCategoryCode
    self.SpendCategoryName = spendCategoryName
    self.TransactionAmount = transactionAmount
    self.TransactionDate = transactionDate
    self.URI = uri
  }
  
  public required convenience init(json: JSON) {
    self.init(allocationType: json["AllocationType"].string, approvedAmount: json["ApprovedAmount"].double, custom1: SCCustomField(json: json["Custom1"]), custom2: SCCustomField(json: json["Custom2"]), custom3: SCCustomField(json: json["Custom3"]), custom4: SCCustomField(json: json["Custom4"]), custom5: SCCustomField(json: json["Custom5"]), custom6: SCCustomField(json: json["Custom6"]), custom7: SCCustomField(json: json["Custom7"]), custom8: SCCustomField(json: json["Custom8"]), custom9: SCCustomField(json: json["Custom9"]), custom10: SCCustomField(json: json["Custom10"]), custom11: SCCustomField(json: json["Custom11"]), custom12: SCCustomField(json: json["Custom12"]), custom13: SCCustomField(json: json["Custom13"]), custom14: SCCustomField(json: json["Custom14"]), custom15: SCCustomField(json: json["Custom15"]), custom16: SCCustomField(json: json["Custom16"]), custom17: SCCustomField(json: json["Custom17"]), custom18: SCCustomField(json: json["Custom18"]), custom19: SCCustomField(json: json["Custom19"]), custom20: SCCustomField(json: json["Custom20"]), custom21: SCCustomField(json: json["Custom21"]), custom22: SCCustomField(json: json["Custom22"]), custom23: SCCustomField(json: json["Custom23"]), custom24: SCCustomField(json: json["Custom24"]), custom25: SCCustomField(json: json["Custom25"]), custom26: SCCustomField(json: json["Custom26"]), custom27: SCCustomField(json: json["Custom27"]), custom28: SCCustomField(json: json["Custom28"]), custom29: SCCustomField(json: json["Custom29"]), custom30: SCCustomField(json: json["Custom30"]), custom31: SCCustomField(json: json["Custom31"]), custom32: SCCustomField(json: json["Custom32"]), custom33: SCCustomField(json: json["Custom33"]), custom34: SCCustomField(json: json["Custom34"]), custom35: SCCustomField(json: json["Custom35"]), custom36: SCCustomField(json: json["Custom36"]), custom37: SCCustomField(json: json["Custom37"]), custom38: SCCustomField(json: json["Custom38"]), custom39: SCCustomField(json: json["Custom39"]), custom40: SCCustomField(json: json["Custom40"]), description: json["Descriptions"].string, entryId: json["EntryID"].string, expenseTypeCode: json["ExpenseTypeCode"].string, expenseTypeName: json["ExpenseTypeName"].string, hasComments: json["HasComments"].bool, hasExceptions: json["HasExceptions"].bool, id: json["ID"].string, isBillable: json["IsBillable"].bool, isImageRequired: json["IsImageRequired"].bool, isPersonal: json["IsPersonal"].bool, lastModified: json["LastModified"].string, locationCountry: json["LocationCountry"].string, locationId: json["LocationID"].string, locationName: json["LocationName"].string, locationSubdivision: json["LocationSubdivision"].string, orgUnit1: SCCustomField(json: json["OrgUnit1"]), orgUnit2: SCCustomField(json: json["OrgUnit2"]), orgUnit3: SCCustomField(json: json["OrgUnit3"]), orgUnit4: SCCustomField(json: json["OrgUnit4"]), orgUnit5: SCCustomField(json: json["OrgUnit5"]), orgUnit6: SCCustomField(json: json["OrgUnit6"]), postedAmount: json["PostedAmount"].double, reportId: json["ReportID"].string, reportOwnerId: json["ReportOwnerID"].string, spendCategoryCode: json["SpendCategoryCode"].string, spendCategoryName: json["SpendCategoryName"].string, transactionAmount: json["TransactionAmount"].double, transactionDate: json["TransactionDate"].string, uri: json["URI"].string)
  }
  
}

public extension ConcurClient {
  
  public func itemizationsGet(options: [String : AnyObject?], callback: (_ error: String!, _ returnValue: ConcurCollection<Itemization>!) -> Void) {
    let request = ConcurClient.getHTTPRequest(endpoint: "api/v3.0/expense/itemizations", options: options)
    ConcurClient.sendRequest(request: request, callback: callback)
  }
  
  public func itemizationsPost(options: [String : AnyObject?], callback: (_ error: String!, _ returnValue: ConcurCollection<Itemization>!) -> Void) {
    let request = ConcurClient.postHTTPRequest(endpoint: "api/v3.0/expense/itemizations", options: options)
    ConcurClient.sendRequest(request: request, callback: callback)
  }
  
  public func itemizationsPut(options: [String : AnyObject?], callback: (_ error: String!, _ returnValue: ConcurCollection<Itemization>!) -> Void) {
    let request = ConcurClient.putHTTPRequest(endpoint: "api/v3.0/expense/itemizations", options: options)
    ConcurClient.sendRequest(request: request, callback: callback)
  }
  
  public func itemizationsDelete(options: [String : AnyObject?], callback: (_ error: String!, _ returnValue: ConcurCollection<Itemization>!) -> Void) {
    let request = ConcurClient.deleteHTTPRequest(endpoint: "api/v3.0/expense/itemizations", options: options)
    ConcurClient.sendRequest(request: request, callback: callback)
  }
  
}
