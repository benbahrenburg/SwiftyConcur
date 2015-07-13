internal class Utilities {
  
  private static var baseUrl = "https://www.concursolutions.com"
  
  internal class func createHTTPRequest(apiEndpoint: String, headers: [String : String], method: String, body: NSData!) -> NSURLRequest {
    let url = NSURL(string: self.baseUrl.stringByAppendingString(apiEndpoint))
    let mutableURLRequest = NSMutableURLRequest(URL: url!)
    mutableURLRequest.HTTPMethod = method
    for (header, value) in headers {
      mutableURLRequest.setValue(value, forHTTPHeaderField: header)
    }
    mutableURLRequest.HTTPBody = body
    return mutableURLRequest
  }
  
  internal class func buildHeaders(extraHeaders: [String : String]) -> [String : String] {
    var headers = [
      "Accept" : "application/json",
      "User-Agent" : "SwiftyConcur",
      "Content-Type" : "application/json"
    ]
    
    for (header, value) in extraHeaders {
      headers[header] = value
    }
    
    return headers
  }
  
}

internal extension Double {
  
  internal func toString() -> String {
    return String(format: "%.3f", self)
  }
  
}