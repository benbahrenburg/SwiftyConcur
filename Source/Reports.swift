import Alamofire
import SwiftyJSON

public class Report: ConcurObject {
  
  private(set) public var AmountDueCompanyCard: Double!
  private(set) public var AmountDueEmployee: Double!
  private(set) public var ApprovalStatusCode: String!
  private(set) public var ApprovalStatusName: String!
  private(set) public var ApproverLoginID: String!
  private(set) public var ApproverName: String!
  private(set) public var Country: String!
  private(set) public var CountrySubdivision: String!
  private(set) public var CreateDate: String!
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
  private(set) public var EverSentBack: Bool!
  private(set) public var HasException: Bool!
  private(set) public var ID: String!
  private(set) public var LastComment: String!
  private(set) public var LastModifiedDate: String!
  private(set) public var LedgerName: String!
  private(set) public var Name: String!
  private(set) public var OrgUnit1: SCCustomField!
  private(set) public var OrgUnit2: SCCustomField!
  private(set) public var OrgUnit3: SCCustomField!
  private(set) public var OrgUnit4: SCCustomField!
  private(set) public var OrgUnit5: SCCustomField!
  private(set) public var OrgUnit6: SCCustomField!
  private(set) public var OwnerLoginID: String!
  private(set) public var OwnerName: String!
  private(set) public var PaidDate: String!
  private(set) public var PaymentStatusCode: String!
  private(set) public var PaymentStatusName: String!
  private(set) public var PersonalAmount: Double!
  private(set) public var PolicyID: String!
  private(set) public var ProcessingPaymentDate: String!
  private(set) public var ReceiptsReceived: Bool!
  private(set) public var SubmitDate: String!
  private(set) public var Total: Double!
  private(set) public var TotalApprovedAmount: Double!
  private(set) public var TotalClaimedAmount: Double!
  private(set) public var URI: String!
  private(set) public var UserDefinedDate: String!
  private(set) public var WorkflowActionUrl: String!
  private(set) public var VendorListItemName: String!
  
  private init(amountDueCompanyCard: Double!, amountDueEmployee: Double!, approvalStatusCode: String!, approvalStatusName: String!, approverLoginID: String!, approverName: String!, country: String!, countrySubdivision: String!, createDate: String!, currencyCode: String!, custom1: SCCustomField!, custom2: SCCustomField!, custom3: SCCustomField!, custom4: SCCustomField!, custom5: SCCustomField!, custom6: SCCustomField!, custom7: SCCustomField!, custom8: SCCustomField!, custom9: SCCustomField!, custom10: SCCustomField!, custom11: SCCustomField!, custom12: SCCustomField!, custom13: SCCustomField!, custom14: SCCustomField!, custom15: SCCustomField!, custom16: SCCustomField!, custom17: SCCustomField!, custom18: SCCustomField!, custom19: SCCustomField!, custom20: SCCustomField!, everSentBack: Bool!, hasException: Bool!, id: String!, lastComment: String!, lastModifiedDate: String!, ledgerName: String!, name: String!, orgUnit1: SCCustomField!, orgUnit2: SCCustomField!, orgUnit3: SCCustomField!, orgUnit4: SCCustomField!, orgUnit5: SCCustomField!, orgUnit6: SCCustomField!, ownerLoginId: String!, ownerName: String!, paidDate: String!, paymentStatusCode: String!, paymentStatusName: String!, personalAmount: Double!, policyId: String!, processingPaymentDate: String!, receiptsReceived: Bool!, submitDate: String!, total: Double!, totalApprovedAmount: Double!, totalClaimedAmount: Double!, uri: String!, userDefinedDate: String!, workflowActionUrl: String!, vendorListItemName: String!) {
    self.AmountDueCompanyCard = amountDueCompanyCard
    self.AmountDueEmployee = amountDueEmployee
    self.ApprovalStatusCode = approvalStatusCode
    self.ApprovalStatusName = approvalStatusName
    self.ApproverLoginID = approverLoginID
    self.ApproverName = approverName
    self.Country = country
    self.CountrySubdivision = countrySubdivision
    self.CreateDate = createDate
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
    self.EverSentBack = everSentBack
    self.HasException = hasException
    self.ID = id
    self.LastComment = lastComment
    self.LastModifiedDate = lastModifiedDate
    self.LedgerName = ledgerName
    self.Name = name
    self.OrgUnit1 = orgUnit1
    self.OrgUnit2 = orgUnit2
    self.OrgUnit3 = orgUnit3
    self.OrgUnit4 = orgUnit4
    self.OrgUnit5 = orgUnit5
    self.OrgUnit6 = orgUnit6
    self.OwnerLoginID = ownerLoginId
    self.OwnerName = ownerName
    self.PaidDate = paidDate
    self.PaymentStatusCode = paymentStatusCode
    self.PaymentStatusName = paymentStatusName
    self.PersonalAmount = personalAmount
    self.PolicyID = policyId
    self.ProcessingPaymentDate = processingPaymentDate
    self.ReceiptsReceived = receiptsReceived
    self.SubmitDate = submitDate
    self.Total = total
    self.TotalApprovedAmount = totalApprovedAmount
    self.TotalClaimedAmount = totalClaimedAmount
    self.URI = uri
    self.UserDefinedDate = userDefinedDate
    self.WorkflowActionUrl = workflowActionUrl
    self.VendorListItemName = vendorListItemName
  }
  
  public required convenience init(json: JSON) {
    self.init(amountDueCompanyCard: json["AmountDueCompanyCard"].double, amountDueEmployee: json["AmountDueEmployee"].double, approvalStatusCode: json["ApprovalStatusCode"].string, approvalStatusName: json["ApprovalStatusName"].string, approverLoginID: json["ApproverLoginID"].string, approverName: json["ApproverName"].string, country: json["Country"].string, countrySubdivision: json["CountrySubdivision"].string, createDate: json["CreateDate"].string, currencyCode: json["CurrencyCode"].string, custom1: SCCustomField(json: json["Custom1"]), custom2: SCCustomField(json: json["Custom2"]), custom3: SCCustomField(json: json["Custom3"]), custom4: SCCustomField(json: json["Custom4"]), custom5: SCCustomField(json: json["Custom5"]), custom6: SCCustomField(json: json["Custom6"]), custom7: SCCustomField(json: json["Custom7"]), custom8: SCCustomField(json: json["Custom8"]), custom9: SCCustomField(json: json["Custom9"]), custom10: SCCustomField(json: json["Custom10"]), custom11: SCCustomField(json: json["Custom11"]), custom12: SCCustomField(json: json["Custom12"]), custom13: SCCustomField(json: json["Custom13"]), custom14: SCCustomField(json: json["Custom14"]), custom15: SCCustomField(json: json["Custom15"]), custom16: SCCustomField(json: json["Custom16"]), custom17: SCCustomField(json: json["Custom17"]), custom18: SCCustomField(json: json["Custom18"]), custom19: SCCustomField(json: json["Custom19"]), custom20: SCCustomField(json: json["Custom20"]), everSentBack: json["EverSentBack"].bool, hasException: json["HaxException"].bool, id: json["ID"].string, lastComment: json["LastComment"].string, lastModifiedDate: json["LastModifiedDate"].string, ledgerName: json["LedgerName"].string, name: json["Name"].string, orgUnit1: SCCustomField(json: json["OrgUnit1"]), orgUnit2: SCCustomField(json: json["OrgUnit2"]), orgUnit3: SCCustomField(json: json["OrgUnit3"]), orgUnit4: SCCustomField(json: json["OrgUnit4"]), orgUnit5: SCCustomField(json: json["OrgUnit5"]), orgUnit6: SCCustomField(json: json["OrgUnit6"]), ownerLoginId: json["OwnerLoginID"].string, ownerName: json["OwnerName"].string, paidDate: json["PaidDate"].string, paymentStatusCode: json["PaymentStatusCode"].string, paymentStatusName: json["PaymentStatusName"].string, personalAmount: json["PersonalAmount"].double, policyId: json["PolicyID"].string, processingPaymentDate: json["ProcessingPaymentDate"].string, receiptsReceived: json["ReceiptsReceived"].string, submitDate: json["SubmitDate"].string, total: json["Total"].double, totalApprovedAmount: json["TotalApprovedAmount"].double, totalClaimedAmount: json["TotalClaimedAmount"].double, uri: json["URI"].string, userDefinedDate: json["UserDefinedDate"].string, workflowActionUrl: json["WorkflowActionURL"].string, vendorListItemName: json["VendorListItemName"].string)
  }
  
}

public extension ConcurClient {
  
  public func reportsGet(options: [String : AnyObject?], callback: (_ error: String, _ returnValue: ConcurCollection<Report>) -> Void) {
    let request = ConcurClient.getHTTPRequest(endpoint: "api/v3.0/expense/entries", options: options)
    ConcurClient.sendRequest(request: request, callback: callback)
  }
  
  public func reportsPost(options: [String : AnyObject?], callback: (_ error: String, _ returnValue: ConcurCollection<Report>) -> Void) {
    let request = ConcurClient.postHTTPRequest(endpoint: "api/v3.0/expense/entries", options: options)
    ConcurClient.sendRequest(request: request, callback: callback)
  }
  
  public func reportsPut(options: [String : AnyObject?], callback: (_ error: String, _ returnValue: ConcurCollection<Report>) -> Void) {
    let request = ConcurClient.putHTTPRequest(endpoint: "api/v3.0/expense/entries", options: options)
    ConcurClient.sendRequest(request: request, callback: callback)
  }
  
}
