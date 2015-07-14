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
  public init(accessToken: String) {
    self.AccessToken = ConcurAccessToken(accessTokenString: accessToken)
  }
  
  public init(accessToken: ConcurAccessToken) {
    self.AccessToken = accessToken
  }
  
}