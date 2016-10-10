import Alamofire
import SwiftyJSON

public extension ConcurClient {
  
  internal static var instanceUrl = "https://www.concursolutions.com/"
  internal static var authString: String!
  
  internal class func getMoreItems(nextPage: String) -> NSURLRequest! {
    var urlString = nextPage
    if let url = URL(string: urlString) {
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
  
  internal class func getHTTPRequest(endpoint: String, options: [String : AnyObject?]) -> NSMutableURLRequest! {
    return self.createRequest(method: "GET", endpoint: endpoint, options: options)
  }
  
  internal class func postHTTPRequest(endpoint: String, options: [String : AnyObject?]) -> NSMutableURLRequest! {
    return self.createRequest(method: "POST", endpoint: endpoint, options: options)
  }
  
  internal class func putHTTPRequest(endpoint: String, options: [String : AnyObject?]) -> NSMutableURLRequest! {
    return self.createRequest(method: "PUT", endpoint: endpoint, options: options)
  }
  
  internal class func deleteHTTPRequest(endpoint: String, options: [String : AnyObject?]) -> NSMutableURLRequest! {
    return self.createRequest(method: "DELETE", endpoint: endpoint, options: options)
  }
  
  internal class func base64Encode(toEncode: String) -> String {
    let utf8Encoded = toEncode.data(using: String.Encoding.utf8)
    let base64Encoded = utf8Encoded?.base64EncodedStringWithOptions(NSData.Base64EncodingOptiuons())
    return base64Encoded!
  }
  
  internal class func sendRequest<T>(request: NSMutableURLRequest) -> (error: String?, returnValue: ConcurCollection<T>?) {
    if self.authString != nil {
      Alamofire.request(request).responseJSON { response in
        if response.result.isSuccess {
          if let json = response.result.value {
            var jsonObject = JSON(json)
            if let error = jsonObject["Error"]["Message"].string {
              return (error: error, returnValue: nil)
            } else if let error = jsonObject["Message"].string {
              return (error: error, returnValue: nil)
            } else {
              return (error: nil, returnValue: ConcurCollection<T>(json: jsonObject))
            }
          } else {
            return (error: nil, returnValue: nil)
          }
        } else {
          return (error: response.result.error?.description, returnValue: nil)
        }
      }
    } else {
      return (error: "Access Token Missing", returnValue: nil)
    }
  }
  
  internal class func createRequest(method: String, endpoint: String, options: [String : AnyObject?]) -> NSMutableURLRequest! {
    // Adds endpoint to end of instance URL
    var urlString = self.instanceUrl.appending(endpoint)
    
    // Adds ID to end of the url string if provided
    if let id = options["id"] as? String {
      urlString = urlString.appending("/").appending(id)
    }
    
    // If parameters are provided, adds ?key=value&key=value... to end of URL
    if let parameters = options["Parameters"] as? [String : String] {
      urlString = urlString.appending("?")
      var currentParamCount = 0
      for (key, value) in parameters {
        urlString = urlString.appending(key).appending("=").appending(value)
        if (currentParamCount + 1) != parameters.count {
          urlString = urlString.appending("&")
          currentParamCount = currentParamCount + 1
        }
      }
    }
    
    // Creates the URL and returns nil if there was an error creating it
    if let url = NSURL(string: urlString) {
      let request = NSMutableURLRequest(URL: url)
      request.HTTPMethod = method
      
      // Encodes the body dictionary into NSData
      if let body = options["Body"] as? [String : AnyObject] {
        var error: NSError?
        var bodyData = try! JSONSerialization.dataWithJSONObject(body, options: JSONSerialization.WritingOptions())
        URLProtocol.setProperty(bodyData, forKey: "BodyData", inRequest: request)
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
  
  private class func addHeaders() -> [String : String] {
    var headers = [
      "Accept" : "application/json",
      "User-Agent" : "SwiftyConcur",
      "Content-Type" : "application/json"
    ]
    
    if self.authString != nil {
      headers.updateValue(self.authString, forKey: "Authorization")
    }
    
    return headers
  }
  
}

internal extension Double {
  
  internal func toString() -> String {
    return String(format: "%.3f", self)
  }
  
}
