import UIKit
import SwiftyConcur

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Example of getting access token
    var client = ConcurClient(consumerKey: "", consumerSecret: "")
    client.getNativeFlowAccessToken("", password: "", callback: { (error, token) in
      if error != nil {
        println(error)
      } else {
        
        // Example of creating client with access token
        client = ConcurClient(accessToken: token)
        
        // Example of building the body for a POST request to Quick Expenses
        var expense = NSMutableDictionary()
        expense.setValue("USD", forKey: "CurrencyCode")
        expense.setValue("123.45", forKey: "TransactionAmount")
        expense.setValue("2015-07-12", forKey: "TransactionDate")
        var options : [String : AnyObject?] = [
          "Body" : expense
        ]
        
        // Example of creating a Quick Expense and receiving the ID and URI back in the callback
        client.quickExpensesPost(options, callback: { (error, expense) in
          if error != nil {
            println(error)
          } else {
            println(expense)
            println(expense.ID)
            println(expense.URI)
          }
        })
      }
    })
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  
  }

}

