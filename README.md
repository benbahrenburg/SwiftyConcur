# SwiftyConcur

Swift SDK for the Concur APIs

## Setup

To get started with SwiftyConcur, you can add it your project using CocoaPods:
```
platform :ios, '8.0'
use_frameworks!

pod 'SwiftyConcur', :git => 'git@github.com:concurlabs/SwiftyConcur.git', :tag => '0.0.4'
``` 

## Get Access to Concur APIs

To get access to Concur's APIs, you'll need a developer account with Concur. Get one by signing up [here](https://developer.concur.com). Your account will have a Key and Secret that are needed for SwiftyConcur.

## Authentication

To obtain an access token, you can choose any of the following OAuth strategies:

##### Native Flow
```
var client = ConcurClient(consumerKey: "", consumerSecret: "")
client.getNativeFlowAccessToken("", password: "", callback: { (error, token) in
  if error != nil {
    // Handle error
  } else {
    // Save token as ConcurAccessToken for later use
  }
})
``` 

## Making Requests

To make requests to Concur's API, you will need to initialize a ConcurClient with an access token. You can do this using the ConcurAccessToken object or just an access token string

```
var client = ConcurClient(accessToken: token) // token is of type ConcurAccessToken
var client = ConcurClient(accessTokenString: tokenStr) // tokenStr is of type String
```

Once the client is initialized, making requests can be made to the API. An example of posting a new Quick Expense can be seen below.

```
var expense = NSMutableDictionary()
expense.setValue("USD", forKey: "CurrencyCode")
expense.setValue("20.15", forKey: "TransactionAmount")
expense.setValue("2015-06-19", forKey: "TransactionDate")
expense.setValue("Concur Business", forKey: "VendorDescription")
var options : [String : AnyObject?] = [
  "Body" : expense
]

client.quickExpensesPost(options, callback: { (error, returnValue) in
  let expense = returnValue as! QuickExpense
})
```
