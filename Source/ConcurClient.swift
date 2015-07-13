import Alamofire
import Foundation
import SwiftyJSON

public class ConcurClient {
  
  private var consumerKey: String!
  private var consumerSecret: String!
  private var accessToken: String!
  
  // Initialization with Consumer Key and Consumer Secret
  public init(consumerKey: String, consumerSecret: String) {
    self.consumerKey = consumerKey
    self.consumerSecret = consumerSecret
  }
  
  // Initialization with Access Token
  public init(accessToken: String) {
    self.accessToken = accessToken
  }
  
  // Get Access Token with Native Flow
  public func getNativeFlowAccessToken(username: String, password: String, callback: (error: String!, expirationDate: String!, instanceUrl: String!, refreshToken: String!, accessToken: String!) -> Void) {
    if consumerKey != nil {
      // Create authorization header string in the format of LoginID:Password, Base-64 encoded
      let authorizationString = username.stringByAppendingString(":").stringByAppendingString(password)
      let authorizationStringUTF = authorizationString.dataUsingEncoding(NSUTF8StringEncoding)
      let authorizationStringBase64 = authorizationStringUTF?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.allZeros)
      let finalAuthorizationString = "Basic ".stringByAppendingString(authorizationStringBase64!)
      
      // Create HTTP Request
      let url = NSURL(string: "https://www.concursolutions.com/net2/oauth2/accesstoken.ashx")
      let mutableURLRequest = NSMutableURLRequest(URL: url!)
      mutableURLRequest.HTTPMethod = "GET"
      mutableURLRequest.setValue(finalAuthorizationString, forHTTPHeaderField: "Authorization")
      mutableURLRequest.setValue(self.consumerKey, forHTTPHeaderField: "X-ConsumerKey")
      mutableURLRequest.setValue("application/json", forHTTPHeaderField: "Accept")
      mutableURLRequest.setValue("SwiftyConcur", forHTTPHeaderField: "User-Agent")
      
      // Send Request and Parse JSON Response
      Alamofire.request(mutableURLRequest).responseJSON { (req, res, json, error) in
        var jsonObject = JSON(json!)
        if let error = jsonObject["Error"]["Message"].string {
          callback(error: error, expirationDate: nil, instanceUrl: nil, refreshToken: nil, accessToken: nil)
        } else {
          jsonObject = jsonObject["Access_Token"]
          callback(error: nil, expirationDate: jsonObject["Expiration_date"].string, instanceUrl: jsonObject["Instance_Url"].string, refreshToken: jsonObject["Refresh_Token"].string, accessToken: jsonObject["Token"].string)
        }
      }
    } else {
      callback(error: "Consumer Key Needed", expirationDate: nil, instanceUrl: nil, refreshToken: nil, accessToken: nil)
    }
  }
  
}