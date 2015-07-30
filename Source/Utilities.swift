import Alamofire

public extension ConcurClient {
  
  internal static var instanceUrl = "https://www.concursolutions.com/"
  internal static var authString: String!
  
  internal class func getMoreItems(nextPage: String) -> NSURLRequest! {
    var urlString = nextPage
    if let url = NSURL(string: urlString) {
      let request = NSMutableURLRequest(URL: url)
      request.HTTPMethod = "GET"
      for (header, value) in self.addHeaders() {
        request.setValue(value, forHTTPHeaderField: header)
      }
      if self.authString != nil {
        request.setValue(self.authString, forHTTPHeaderField: "Authorization")
      }
      return request
    } else {
      return nil
    }
  }
  
  private class func createRequest(method: String, endpoint: String, options: [String : AnyObject?]) -> NSMutableURLRequest! {
    // Adds endpoint to end of instance URL
    var urlString = self.instanceUrl.stringByAppendingString(endpoint)
    
    // Adds ID to end of the url string if provided
    if let id = options["id"] as? String {
      urlString = urlString.stringByAppendingString("/").stringByAppendingString(id)
    }
    
    // If parameters are provided, adds ?key=value&key=value... to end of URL
    if let parameters = options["Parameters"] as? [String : String] {
      urlString = urlString.stringByAppendingString("?")
      var currentParamCount = 0
      for (key, value) in parameters {
        urlString = urlString.stringByAppendingString(key).stringByAppendingString("=").stringByAppendingString(value)
        if parameters.count != ++currentParamCount {
          urlString = urlString.stringByAppendingString("&")
        }
      }
    }
    
    // Creates the URL and returns nil if there was an error creating it
    if let url = NSURL(string: urlString) {
      let request = NSMutableURLRequest(URL: url)
      request.HTTPMethod = method
      
      // Encodes the body dictionary into NSData
      if let body = options["Body"] as? [String : String] {
        var error: NSError?
        var bodyData = NSJSONSerialization.dataWithJSONObject(body, options: NSJSONWritingOptions.allZeros, error: &error)
        request.HTTPBody = bodyData
      }
      
      // Assigns default headers
      for (header, value) in self.addHeaders() {
        request.setValue(value, forHTTPHeaderField: header)
      }
      
      // Assigns additional headers, overwriting old ones if provided
      if let headers = options["Headers"] as? [String : String] {
        for (header, value) in headers {
          request.setValue(value, forHTTPHeaderField: header)
        }
      }
      
      // Returns the request
      return request
    } else {
      return nil
    }
  }
  
  internal class func getHTTPRequest(endpoint: String, options: [String : AnyObject?]) -> NSURLRequest! {
    return self.createRequest("GET", endpoint: endpoint, options: options)
  }
  
  internal class func postHTTPRequest(endpoint: String, options: [String : AnyObject?]) -> NSURLRequest! {
    return self.createRequest("POST", endpoint: endpoint, options: options)
  }
  
  internal class func putHTTPRequest(endpoint: String, options: [String : AnyObject?]) -> NSURLRequest! {
    return self.createRequest("PUT", endpoint: endpoint, options: options)
  }
  
  internal class func deleteHTTPRequest(endpoint: String, options: [String : AnyObject?]) -> NSURLRequest! {
    return self.createRequest("DELETE", endpoint: endpoint, options: options)
  }
  
  internal class func base64Encode(toEncode: String) -> String {
    let utf8Encoded = toEncode.dataUsingEncoding(NSUTF8StringEncoding)
    let base64Encoded = utf8Encoded?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.allZeros)
    return base64Encoded!
  }
  
  private class func addHeaders() -> [String : String] {
    var headers = [
      "Accept" : "application/json",
      "User-Agent" : "SwiftyConcur",
      "Content-Type" : "application/json"
    ]
    
    if self.authString != nil {
      headers.updateValue(self.authString, forKey: "Authorization")
    }
    
    println(headers)
    
    return headers
  }
  
}

internal extension Double {
  
  internal func toString() -> String {
    return String(format: "%.3f", self)
  }
  
}