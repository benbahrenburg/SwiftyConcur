import Alamofire
import SwiftyJSON

public class ConcurClient {
  
  internal var ConsumerKey: String!
  internal var ConsumerSecret: String!
  internal var AccessToken: ConcurAccessToken!
  
  // Initialization with Consumer Key and Consumer Secret
  public init(consumerKey: String, consumerSecret: String) {
    self.ConsumerKey = consumerKey
    self.ConsumerSecret = consumerSecret
  }
  
  public init(consumerKey: String, consumerSecret: String, accessToken: ConcurAccessToken) {
    self.AccessToken = accessToken
    ConcurClient.authString = "OAuth ".stringByAppendingString(self.AccessToken.Token)
    if let token = accessToken.InstanceUrl {
      ConcurClient.instanceUrl = token
    }
    self.ConsumerKey = consumerKey
    self.ConsumerSecret = consumerSecret
  }
  
  public func setAccessToken(accessToken: ConcurAccessToken) {
    self.AccessToken = accessToken
    ConcurClient.authString = "OAuth ".stringByAppendingString(self.AccessToken.Token)
    if let token = accessToken.InstanceUrl {
      ConcurClient.instanceUrl = token
    }
  }
  
  public func refreshToken(callback: (_ error: String!, _ accessToken: ConcurAccessToken!) -> Void) {
    if self.ConsumerKey != nil && self.ConsumerSecret != nil && self.AccessToken != nil && self.AccessToken.RefreshToken != nil {
      var options: [String : AnyObject?] = [
        "Parameters" : [
          "refresh_token" : self.AccessToken.RefreshToken,
          "client_id" : self.ConsumerKey,
          "client_secret" : self.ConsumerSecret
        ]
      ]
      var request = ConcurClient.postHTTPRequest("net2/oauth2/getaccesstoken.ashx", options: options)
      Alamofire.request(request).responseJSON { response in
        if response.result.isSuccess {
          var jsonObject = JSON(response.result.value!)
          if let err = jsonObject["Error"]["Message"].string {
            callback(error: err, accessToken: nil)
          } else {
            jsonObject = jsonObject["Access_Token"]
            callback(error: nil, accessToken: ConcurAccessToken(json: jsonObject))
          }
        } else {
          callback(error: response.result.error?.description, accessToken: nil)
        }
      }
    } else {
      if self.ConsumerKey == nil {
        callback(error: "Consumer Key missing", accessToken: nil)
      }
      else if self.ConsumerSecret == nil {
        callback(error: "Consumer Secret missing", accessToken: nil)
      }
      else if self.AccessToken == nil {
        callback(error: "Access Token missing", accessToken: nil)
      }
      else if self.AccessToken.RefreshToken == nil {
        callback(error: "Refresh Token missing", accessToken: nil)
      }
    }
  }
  
}
