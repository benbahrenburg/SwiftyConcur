import Alamofire

public extension ConcurClient {
  
  internal static var instanceUrl = "https://www.concursolutions.com"
  internal static var authString: String!
  
  internal class func getHTTPRequest(endpoint: String, options: [String : AnyObject?]) -> NSURLRequest! {
    var urlString = self.instanceUrl.stringByAppendingString(endpoint)
    if let id = options["id"] as? String {
      urlString = urlString.stringByAppendingString("/").stringByAppendingString(id)
    }
    if let url = NSURL(string: urlString) {
      let request = NSMutableURLRequest(URL: url)
      request.HTTPMethod = "GET"
      if let body = options["Body"] as? NSMutableDictionary {
        var error: NSError?
        var bodyData = NSJSONSerialization.dataWithJSONObject(body, options: NSJSONWritingOptions.allZeros, error: &error)
        request.HTTPBody = bodyData
      }
      if let headers = options["Headers"] as? [String : String] {
        for (header, value) in headers {
          request.setValue(value, forHTTPHeaderField: header)
        }
      }
      for (header, value) in self.addHeaders() {
        request.setValue(value, forHTTPHeaderField: header)
      }
      if self.authString != nil {
        request.setValue(self.authString, forHTTPHeaderField: "Authorization")
      }
      if let parameters = options["Parameters"] as? [String : String] {
        Alamofire.ParameterEncoding.URL.encode(request, parameters: parameters)
      }
      return request
    } else {
      return nil
    }
  }
  
  internal class func getMoreItems(nextPage: String) -> NSURLRequest! {
    var urlString = self.instanceUrl.stringByAppendingString(nextPage)
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
  
  internal class func postHTTPRequest(endpoint: String, options: [String : AnyObject?]) -> NSURLRequest! {
    if let url = NSURL(string: self.instanceUrl.stringByAppendingString(endpoint)) {
      let request = NSMutableURLRequest(URL: url)
      request.HTTPMethod = "POST"
      if let body = options["Body"] as? NSMutableDictionary {
        var error: NSError?
        var bodyData = NSJSONSerialization.dataWithJSONObject(body, options: NSJSONWritingOptions.allZeros, error: &error)
        request.HTTPBody = bodyData
      }
      if let headers = options["Headers"] as? [String : String] {
        for (header, value) in headers {
          request.setValue(value, forHTTPHeaderField: header)
        }
      }
      for (header, value) in self.addHeaders() {
        request.setValue(value, forHTTPHeaderField: header)
      }
      if self.authString != nil {
        request.setValue(self.authString, forHTTPHeaderField: "Authorization")
      }
      if let parameters = options["Parameters"] as? [String : String] {
        Alamofire.ParameterEncoding.URL.encode(request, parameters: parameters)
      }
      return request
    } else {
      return nil
    }
  }
  
  internal class func putHTTPRequest(endpoint: String, options: [String : AnyObject?]) -> NSURLRequest! {
    if let id = options["id"] as? String {
      if let url = NSURL(string: self.instanceUrl.stringByAppendingString(endpoint).stringByAppendingString("/").stringByAppendingString(id)) {
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "PUT"
        if let body = options["Body"] as? NSMutableDictionary {
          var error: NSError?
          var bodyData = NSJSONSerialization.dataWithJSONObject(body, options: NSJSONWritingOptions.allZeros, error: &error)
          request.HTTPBody = bodyData
        }
        if let headers = options["Headers"] as? [String : String] {
          for (header, value) in headers {
            request.setValue(value, forHTTPHeaderField: header)
          }
        }
        for (header, value) in self.addHeaders() {
          request.setValue(value, forHTTPHeaderField: header)
        }
        if self.authString != nil {
          request.setValue(self.authString, forHTTPHeaderField: "Authorization")
        }
        if let parameters = options["Parameters"] as? [String : String] {
          Alamofire.ParameterEncoding.URL.encode(request, parameters: parameters)
        }
        return request
      } else {
        return nil
      }
    } else {
      return nil
    }
  }
  
  internal class func deleteHTTPRequest(endpoint: String, options: [String : AnyObject?]) -> NSURLRequest! {
    if let id = options["id"] as? String {
      if let url = NSURL(string: self.instanceUrl.stringByAppendingString(endpoint).stringByAppendingString("/").stringByAppendingString(id)) {
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "DELETE"
        if let body = options["Body"] as? NSMutableDictionary {
          var error: NSError?
          var bodyData = NSJSONSerialization.dataWithJSONObject(body, options: NSJSONWritingOptions.allZeros, error: &error)
          request.HTTPBody = bodyData
        }
        if let headers = options["Headers"] as? [String : String] {
          for (header, value) in headers {
            request.setValue(value, forHTTPHeaderField: header)
          }
        }
        for (header, value) in self.addHeaders() {
          request.setValue(value, forHTTPHeaderField: header)
        }
        if self.authString != nil {
          request.setValue(self.authString, forHTTPHeaderField: "Authorization")
        }
        if let parameters = options["Parameters"] as? [String : String] {
          Alamofire.ParameterEncoding.URL.encode(request, parameters: parameters)
        }
        return request
      } else {
        return nil
      }
    } else {
      return nil
    }
  }
  
  internal class func base64Encode(toEncode: String) -> String {
    let utf8Encoded = toEncode.dataUsingEncoding(NSUTF8StringEncoding)
    let base64Encoded = utf8Encoded?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.allZeros)
    return base64Encoded!
  }
  
  private class func addHeaders() -> [String : String] {
    return [
      "Accept" : "application/json",
      "User-Agent" : "SwiftyConcur",
      "Content-Type" : "application/json"
    ]
  }
  
}

internal extension Double {
  
  internal func toString() -> String {
    return String(format: "%.3f", self)
  }
  
}