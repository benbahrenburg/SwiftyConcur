import UIKit
import SwiftyConcur

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
  }
  
  @IBAction func onTouch(sender: AnyObject) {
    var client = ConcurClient(consumerKey: "", consumerSecret: "")
    client.openWebFlow(self, scopeList: ["EXPRPT"], state: "weirdstate", callback: { (error, token, state) in
      println(error)
      println(token)
      println(state)
    })
  }
  
}

