import Alamofire
import SwiftyJSON

public extension ConcurClient {
  
  // Get Access Token with Native Flow
  public func getNativeFlowAccessToken(username: String, password: String, callback: (_ error: String!, _ accessToken: ConcurAccessToken!) -> Void) {
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
      
      Alamofire.request(request).responseJSON { response in
        if response.result.isSuccess {
          var jsonObject = JSON(response.result.value!)
          if let error = jsonObject["Error"]["Message"].string {
            callback(error: error, accessToken: nil)
          } else {
            jsonObject = jsonObject["Access_Token"]
            var token = ConcurAccessToken(json: jsonObject)
            callback(error: nil, accessToken: token)
          }
        } else {
          callback(error: response.result.error?.description, accessToken: nil)
        }
      }
    } else {
      callback(error: "Consumer Key Needed", accessToken: nil)
    }
  }
  
}
