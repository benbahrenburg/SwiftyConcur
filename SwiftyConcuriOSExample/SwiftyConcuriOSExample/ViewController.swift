import UIKit
import SwiftyConcur

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if UIApplication.sharedApplication().canOpenURL(NSURL(string: "concurmobile://")!) == false {
      self.connectButton.hidden = true
    }
    if let accessToken = NSUserDefaults.standardUserDefaults().objectForKey("ConcurAccessToken") as? String {
      self.connectButton.setTitle("Disconnect With Concur", forState: UIControlState.Normal)
    } else {
      self.connectButton.setTitle("Connect With Concur", forState: UIControlState.Normal)
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
  }
  
  @IBAction func onTouch(sender: AnyObject) {
    if self.connectButton.titleLabel!.text == "Connect With Concur" {
      var client = ConcurClient(consumerKey: "", consumerSecret: "")
      client.openWebFlow(self, scopeList: ["EXPRPT"], state: "weirdstate", callback: { (error, token, state) in
        if error == nil && token != nil {
          NSUserDefaults.standardUserDefaults().setObject(token.Token, forKey: "ConcurAccessToken")
          self.connectButton.setTitle("Disconnect With Concur", forState: UIControlState.Normal)
        }
      })
    } else {
      NSUserDefaults.standardUserDefaults().removeObjectForKey("ConcurAccessToken")
      self.connectButton.setTitle("Connect With Concur", forState: UIControlState.Normal)
    }
  }
  
  @IBOutlet weak var connectButton: UIButton!
}

