import Alamofire
import SwiftyJSON

public class Allocation: ConcurObject {
  
  private(set) public var AccountCode1: String!
  private(set) public var AccountCode2: String!
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
  private(set) public var EntryID: String!
  private(set) public var ID: String!
  private(set) public var IsHidden: Bool!
  private(set) public var IsPercentEdited: Bool!
  private(set) public var Percentage: String!
  private(set) public var URI: String!
  
  private init(accountCode1: String!, accountCode2: String!, custom1: SCCustomField!, custom2: SCCustomField!, custom3: SCCustomField!, custom4: SCCustomField!, custom5: SCCustomField!, custom6: SCCustomField!, custom7: SCCustomField!, custom8: SCCustomField!, custom9: SCCustomField!, custom10: SCCustomField!, custom11: SCCustomField!, custom12: SCCustomField!, custom13: SCCustomField!, custom14: SCCustomField!, custom15: SCCustomField!, custom16: SCCustomField!, custom17: SCCustomField!, custom18: SCCustomField!, custom19: SCCustomField!, custom20: SCCustomField!, entryId: String!, id: String!, isHidden: Bool!, isPercentEdited: Bool!, percentage: String!, uri: String!) {
    self.AccountCode1 = accountCode1
    self.AccountCode2 = accountCode2
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
    self.EntryID = entryId
    self.ID = id
    self.IsHidden = isHidden
    self.IsPercentEdited = isPercentEdited
    self.Percentage = percentage
    self.URI = uri
  }
  
  public required convenience init(json: JSON) {
    self.init(accountCode1: json["AccountCode1"].string, accountCode2: json["AccountCode2"].string, custom1: SCCustomField(json: json["Custom1"]), custom2: SCCustomField(json: json["Custom2"]), custom3: SCCustomField(json: json["Custom3"]), custom4: SCCustomField(json: json["Custom4"]), custom5: SCCustomField(json: json["Custom5"]), custom6: SCCustomField(json: json["Custom6"]), custom7: SCCustomField(json: json["Custom7"]), custom8: SCCustomField(json: json["Custom8"]), custom9: SCCustomField(json: json["Custom9"]), custom10: SCCustomField(json: json["Custom10"]), custom11: SCCustomField(json: json["Custom11"]), custom12: SCCustomField(json: json["Custom12"]), custom13: SCCustomField(json: json["Custom13"]), custom14: SCCustomField(json: json["Custom14"]), custom15: SCCustomField(json: json["Custom15"]), custom16: SCCustomField(json: json["Custom16"]), custom17: SCCustomField(json: json["Custom17"]), custom18: SCCustomField(json: json["Custom18"]), custom19: SCCustomField(json: json["Custom19"]), custom20: SCCustomField(json: json["Custom20"]), entryId: json["EntryID"].string, id: json["ID"].string, isHidden: json["IsHidden"].bool, isPercentEdited: json["IsPercentEdited"].bool, percentage: json["Percentage"].string, uri: json["URI"].string)
  }
  
}

public extension ConcurClient {
  
  public func allocationsGet(options: [String : AnyObject?], callback: (error: String!, returnValue: ConcurCollection<Allocation>!) -> Void) {
    let request = ConcurClient.getHTTPRequest("api/v3.0/expense/allocations", options: options)
    ConcurClient.sendRequest(request, callback: callback)
  }
  
}
