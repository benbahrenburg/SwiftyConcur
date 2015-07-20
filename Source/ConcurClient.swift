public class ConcurClient {
  
  internal var ConsumerKey: String!
  internal var ConsumerSecret: String!
  internal var AccessToken: ConcurAccessToken!
  
  // Initialization with Consumer Key and Consumer Secret
  public init(consumerKey: String, consumerSecret: String) {
    self.ConsumerKey = consumerKey
    self.ConsumerSecret = consumerSecret
  }
  
  // Initialization with Access Token string
  public init(accessTokenString: String) {
    self.AccessToken = ConcurAccessToken(accessTokenString: accessTokenString)
  }
  
  public init(accessToken: ConcurAccessToken) {
    self.AccessToken = accessToken
    ConcurClient.authString = "OAuth ".stringByAppendingString(self.AccessToken.Token)
    if let token = accessToken.InstanceUrl {
      ConcurClient.instanceUrl = token
    }
  }
  
}