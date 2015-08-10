import Alamofire
import SwiftyJSON
import UIKit

public extension ConcurClient {
  
  public func openWebFlow(currentController: UIViewController, scopeList: [String], state: String!, callback: (error: String!, token: ConcurAccessToken!, state: String!) -> Void) {
    if self.ConsumerKey != nil && self.ConsumerSecret != nil {
      if scopeList.isEmpty == false {
        var scopeString = ""
        for (index, element) in enumerate(scopeList) {
          scopeString += element
          if index != scopeList.count - 1 {
            scopeString += ","
          }
        }
        var webFlowController = ConcurWebFlowView()
        webFlowController.request = NSURLRequest(URL: NSURL(string: "https://www.concursolutions.com/net2/oauth2/Login.aspx?client_id=\(self.ConsumerKey)&scope=\(scopeString)&redirect_uri=WebFlowSDKiOS/&state=\(state)")!)
        webFlowController.client = self
        webFlowController.callback = callback
        currentController.presentViewController(webFlowController, animated: true, completion: { })
      } else {
        callback(error: "Scope Array is Empty", token: nil, state: state)
      }
    } else {
      if self.ConsumerKey == nil {
        callback(error: "Consumer Key Missing", token: nil, state: state)
      }
      if self.ConsumerSecret == nil {
        callback(error: "Consumer Secret Missing", token: nil, state: state)
      }
    }
  }
  
  private func exchangeCode(requestToken: String, state: String!, callback: (error: String!, accessToken: ConcurAccessToken!, state: String!) -> Void) {
    if self.ConsumerKey != nil && self.ConsumerSecret != nil {
      var options: [String : AnyObject?] = [
        "Parameters" : [
          "code" : requestToken,
          "client_id" : self.ConsumerKey!,
          "client_secret" : self.ConsumerSecret!
        ]
      ]
      
      var request = ConcurClient.getHTTPRequest("net2/oauth2/getaccesstoken.ashx", options: options)
      Alamofire.request(request).responseJSON { (req, res, json, error) in
        if error == nil {
          var jsonObject = JSON(json!)
          if let err = jsonObject["Error"]["Message"].string {
            callback(error: err, accessToken: nil, state: state)
          } else {
            jsonObject = jsonObject["Access_Token"]
            var token = ConcurAccessToken(json: jsonObject)
            callback(error: nil, accessToken: token, state: state)
          }
        } else {
          callback(error: error?.description, accessToken: nil, state: state)
        }
      }
    } else {
      if self.ConsumerKey == nil {
        callback(error: "Consumer Key Missing", accessToken: nil, state: state)
      } else if self.ConsumerSecret == nil {
        callback(error: "Consumer Secret Missing", accessToken: nil, state: state)
      }
    }
  }
  
}

public class ConcurWebFlowView : UIViewController, UIWebViewDelegate {
  
  var webView : UIWebView!
  var request : NSURLRequest!
  var client : ConcurClient!
  var callback : ((String!, ConcurAccessToken!, String!) -> Void)!
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    self.webView = UIWebView(frame: self.view.frame)
    self.webView.delegate = self
    self.view.addSubview(self.webView)
    self.webView.loadRequest(request)
  }
  
  public func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
    if request.URLString.rangeOfString("/?code=") != nil {
      var startCodeIndex = request.URLString.rangeOfString("code=", options: NSStringCompareOptions.BackwardsSearch)?.endIndex
      var endCodeIndex = request.URLString.rangeOfString("&state=", options: NSStringCompareOptions.BackwardsSearch)?.startIndex
      var startStateIndex = request.URLString.rangeOfString("&state=", options: NSStringCompareOptions.BackwardsSearch)?.endIndex
      
      var code = request.URLString.substringWithRange(Range<String.Index>(start: startCodeIndex!, end: endCodeIndex!))
      var state = request.URLString.substringFromIndex(startStateIndex!)
      
      self.dismissViewControllerAnimated(true, completion: {
        self.client.exchangeCode(code, state: state, callback: self.callback)
      })
    }
    return true
  }
  
}