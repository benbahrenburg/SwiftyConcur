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
    ConcurClient.authString = "OAuth ".appending(self.AccessToken.Token)
    if let token = accessToken.InstanceUrl {
      ConcurClient.instanceUrl = token
    }
    self.ConsumerKey = consumerKey
    self.ConsumerSecret = consumerSecret
  }
  
  public func setAccessToken(accessToken: ConcurAccessToken) {
    self.AccessToken = accessToken
    ConcurClient.authString = "OAuth ".appending(self.AccessToken.Token)
    if let token = accessToken.InstanceUrl {
      ConcurClient.instanceUrl = token
    }
  }
  
  public func refreshToken() -> (error: String!, accessToken: ConcurAccessToken!) {
    if self.ConsumerKey != nil && self.ConsumerSecret != nil && self.AccessToken != nil && self.AccessToken.RefreshToken != nil {
      var options: [String : AnyObject] = [
        "Parameters" : [
          "refresh_token" : self.AccessToken.RefreshToken,
          "client_id" : self.ConsumerKey,
          "client_secret" : self.ConsumerSecret
        ]
      ]
      var request = ConcurClient.postHTTPRequest(endpoint: "net2/oauth2/getaccesstoken.ashx", options: options)
      Alamofire.request(request).responseJSON { response in
        if response.result.isSuccess {
          var jsonObject = JSON(response.result.value!)
          if let err = jsonObject["Error"]["Message"].string {
            return (error: err, accessToken: nil)
          } else {
            jsonObject = jsonObject["Access_Token"]
            return (error: nil, accessToken: ConcurAccessToken(json: jsonObject))
          }
        } else {
          return (error: response.result.error?.description, accessToken: nil)
        }
      }
    } else {
      if self.ConsumerKey == nil {
        return (error: "Consumer Key missing", accessToken: nil)
      }
      else if self.ConsumerSecret == nil {
        return (error: "Consumer Secret missing", accessToken: nil)
      }
      else if self.AccessToken == nil {
        return (error: "Access Token missing", accessToken: nil)
      }
      else if self.AccessToken.RefreshToken == nil {
        return (error: "Refresh Token missing", accessToken: nil)
      }
    }
  }
  
}
