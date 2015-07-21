# SwiftyConcur [![Build Status](https://travis-ci.org/concurlabs/SwiftyConcur.svg?branch=master)](https://travis-ci.org/concurlabs/SwiftyConcur)

Swift SDK for the Concur APIs

## Setup

To get started with SwiftyConcur, you can add it your project using CocoaPods:
```
platform :ios, '8.0'
use_frameworks!

pod 'SwiftyConcur', :git => 'https://github.com/concurlabs/SwiftyConcur.git', :tag => '0.0.7'
``` 

## Tests

To run unit tests on SwiftyConcur, open the SwiftyConcuriOSExample workspace and select `Product > Test` or press `CMD + U`

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

Once the client is initialized, making requests can be made to the API. An example of the Quick Expense endpoint can be seen below.

```
// QuickExpenses POST
var options : [String : AnyObject?] = [
  "Body" : [
    "CurrencyCode" : "USD",
    "TransactionAmount" : "20.15",
    "TransactionDate" : "2015-06-19"
  ]
]
client.quickExpensesPost(options, callback: { (error, returnValue) in
  if error == nil {
    let expense = returnValue as! ConcurCollection<QuickExpense>
  } else {
    // Handle error
  }
})

// QuickExpenses GET
client.quickExpensesGet([ : ], callback: { (error, returnValue) in
  if error == nil {
    let expenses: ConcurCollection<QuickExpense> = returnValue as! ConcurCollection<QuickExpense>
  } else {
    // Handle error
  }
})
```

## License

See LICENSE file for more info.
