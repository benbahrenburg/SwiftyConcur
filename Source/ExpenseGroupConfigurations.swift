import Alamofire
import SwiftyJSON

public class ExpenseGroupConfiguration: ConcurObject {
  
  private(set) public var AllowUserDigitalTaxInvoice: Bool!
  private(set) public var AllowUserRegisterYodlee: Bool!
  private(set) public var AttendeeListFormID: String!
  private(set) public var AttendeeListFormName: String!
  private(set) public var AttendeeTypes: [SCAttendeeType]!
  private(set) public var CashAdvance: SCCashAdvance!
  private(set) public var ID: String!
  private(set) public var Name: String!
  private(set) public var PaymentTypes: [SCPaymentType]!
  private(set) public var Policies: [SCPolicy]!
  private(set) public var URI: String!
  
  private init(allowUserDigitalTaxInvoice: Bool!, allowUserRegisterYodlee: Bool!, attendeeListFormID: String!, attendeeListFormName: String!, attendeeTypes: [SCAttendeeType]!, cashAdvance: SCCashAdvance!, id: String!, name: String!, paymentTypes: [SCPaymentType]!, policies: [SCPolicy]!, uri: String!) {
    self.AllowUserDigitalTaxInvoice = allowUserDigitalTaxInvoice
    self.AllowUserRegisterYodlee = allowUserRegisterYodlee
    self.AttendeeListFormID = attendeeListFormID
    self.AttendeeListFormName = attendeeListFormName
    self.AttendeeTypes = attendeeTypes
    self.CashAdvance = cashAdvance
    self.ID = id
    self.Name = name
    self.PaymentTypes = paymentTypes
    self.Policies = policies
    self.URI = uri
  }
  
  public required convenience init(json: JSON) {
    var attendeeTypeArray: [SCAttendeeType]! = []
    for (index, subJson) : (String, JSON) in json["AttendeeTypes"] {
      attendeeTypeArray.append(SCAttendeeType(json: subJson))
    }
    var paymentTypeArray: [SCPaymentType]! = []
    for (index, subJson) : (String, JSON) in json["PaymentTypes"] {
      paymentTypeArray.append(SCPaymentType(json: subJson))
    }
    var policyArray: [SCPolicy]! = []
    for (index, subJson) : (String, JSON) in json["Policies"] {
      policyArray.append(SCPolicy(json: subJson))
    }
    self.init(allowUserDigitalTaxInvoice: json["AllowUserDigitalTaxInvoice"].bool, allowUserRegisterYodlee: json["AllowUserRegisterYodlee"].bool, attendeeListFormID: json["AttendeeListFormID"].string, attendeeListFormName: json["AttendeeListFormName"].string, attendeeTypes: attendeeTypeArray, cashAdvance: SCCashAdvance(json: json["CashAdvance"]), id: json["ID"].string, name: json["Name"].string, paymentTypes: paymentTypeArray, policies: policyArray, uri: json["URI"].string)
  }
  
}

public class SCAttendeeType {
  
  private(set) public var Code: String!
  private(set) public var Name: String!
  
  private init(code: String!, name: String!) {
    self.Code = code
    self.Name = name
  }
  
  public convenience init(json: JSON) {
    self.init(code: json["Code"].string, name: json["Name"].string)
  }
  
}

public class SCCashAdvance {
  
  private(set) public var AllowUserCarryBalance: Bool!
  private(set) public var AllowUserLinkMultiple: Bool!
  private(set) public var AllowUserUpdateExchangeRate: Bool!
  private(set) public var Name: String!
  private(set) public var WorkflowID: String!
  
  private init(allowUserCarryBalance: Bool!, allowUserLinkMultiple: Bool!, allowUserUpdateExchangeRate: Bool!, name: String!, workflowId: String!) {
    self.AllowUserCarryBalance = allowUserCarryBalance
    self.AllowUserLinkMultiple = allowUserLinkMultiple
    self.AllowUserUpdateExchangeRate = allowUserUpdateExchangeRate
    self.Name = name
    self.WorkflowID = workflowId
  }
  
  public convenience init(json: JSON) {
    self.init(allowUserCarryBalance: json["AllowUserCarryBalance"].bool, allowUserLinkMultiple: json["AllowUserLinkMultiple"].bool, allowUserUpdateExchangeRate: json["AllowUserUpdateExchangeRate"].bool, name: json["Name"].string, workflowId: json["WorkflowID"].string)
  }
  
}

public class SCPaymentType {
  
  private(set) public var ID: String!
  private(set) public var IsDefault: Bool!
  private(set) public var Name: String!
  
  private init(id: String!, isDefault: Bool!, name: String!) {
    self.ID = id
    self.IsDefault = isDefault
    self.Name = name
  }
  
  public convenience init(json: JSON) {
    self.init(id: json["ID"].string, isDefault: json["IsDefault"].bool, name: json["Name"].string)
  }
  
}

public class SCPolicy {
  
  private(set) public var ExpenseTypes: [SCExpenseType]!
  private(set) public var ID: String!
  private(set) public var IsDefault: Bool!
  private(set) public var IsInheritable: Bool!
  private(set) public var Name: String!
  
  private init(expenseTypes: [SCExpenseType]!, id: String!, isDefault: Bool!, isInheritable: Bool!, name: String!) {
    self.ExpenseTypes = expenseTypes
    self.ID = id
    self.IsDefault = isDefault
    self.IsInheritable = isInheritable
    self.Name = name
  }
  
  public convenience init(json: JSON) {
    var expenseTypeArray: [SCExpenseType]! = []
    for (index, subJson) : (String, JSON) in json["ExpenseTypes"] {
      expenseTypeArray.append(SCExpenseType(json: subJson))
    }
    self.init(expenseTypes: expenseTypeArray, id: json["ID"].string, isDefault: json["IsDefault"].bool, isInheritable: json["IsInheritable"].bool, name: json["Name"].string)
  }
  
}

public class SCExpenseType {
  
  private(set) public var Code: String!
  private(set) public var ExpenseCode: String!
  private(set) public var Name: String!
  
  private init(code: String!, expenseCode: String!, name: String!) {
    self.Code = code
    self.ExpenseCode = expenseCode
    self.Name = name
  }
  
  public convenience init(json: JSON) {
    self.init(code: json["Code"].string, expenseCode: json["ExpenseCode"].string, name: json["Name"].string)
  }
  
}

public extension ConcurClient {
  
  public func expenseGroupConfigurationsGet(options: [String : AnyObject?], callback: (error: String!, returnValue: ConcurCollection<ExpenseGroupConfiguration>!) -> Void) {
    let request = ConcurClient.getHTTPRequest("api/v3.0/expense/expensegroupconfigurations", options: options)
    ConcurClient.sendRequest(request, callback: callback)
  }
  
}