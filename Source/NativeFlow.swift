import Alamofire
import SwiftyJSON

public extension ConcurClient {
  
  // Get Access Token with Native Flow
  public func getNativeFlowAccessToken(username: String, password: String, callback: (error: String!, accessToken: ConcurAccessToken!) -> Void) {
    if self.ConsumerKey != nil {
      // Create authorization header string in the format of LoginID:Password, Base-64 encoded
      let authorizationString = username.stringByAppendingString(":").stringByAppendingString(password)
      let finalAuthorizationString = "Basic ".stringByAppendingString(ConcurClient.base64Encode(authorizationString))
      
      var options: [String : AnyObject?] = [
        "Headers" : [
          "Authorization" : finalAuthorizationString,
          "X-ConsumerKey" : self.ConsumerKey!
        ]
      ]
      var request = ConcurClient.getHTTPRequest("net2/oauth2/accesstoken.ashx", options: options)
      
      Alamofire.request(request).responseJSON { (req, res, json, error) in
        if error == nil {
          var jsonObject = JSON(json!)
          if let err = jsonObject["Error"]["Message"].string {
            callback(error: err, accessToken: nil)
          } else {
            jsonObject = jsonObject["Access_Token"]
            var token = ConcurAccessToken(json: jsonObject)
            self.AccessToken = token
            callback(error: nil, accessToken: token)
          }
        } else {
          callback(error: error?.description, accessToken: nil)
        }
      }
    } else {
      callback(error: "Consumer Key Needed", accessToken: nil)
    }
  }
  
}