import SwiftyJSON

public class ConcurAccessToken {
  
  public var ExpirationDate: String!
  public var InstanceUrl: String!
  public var RefreshToken: String!
  public var Token: String!
  
  public init(json: JSON) {
    self.ExpirationDate = json["Expiration_date"].string
    self.InstanceUrl = json["Instance_Url"].string
    self.RefreshToken = json["Refresh_Token"].string
    self.Token = json["Token"].string
  }
  
  public init(accessTokenString: String) {
    self.Token = accessTokenString
  }
  
}