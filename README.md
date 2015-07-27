# SwiftyConcur [![Build Status](https://travis-ci.org/concurlabs/SwiftyConcur.svg?branch=master)](https://travis-ci.org/concurlabs/SwiftyConcur)

Swift SDK for the Concur APIs.

## Setup

To get started with SwiftyConcur, you can add it your project using CocoaPods:

```
platform :ios, '8.0'
use_frameworks!

pod 'SwiftyConcur', :git => 'https://github.com/concurlabs/SwiftyConcur.git', :tag => '0.0.8'
``` 

## Tests

To run unit tests on SwiftyConcur, open the SwiftyConcuriOSExample workspace and run one of the following commands:

- `Product -> Test`
- `CMD + U`

## Getting Access to Concur APIs

To get access to Concur's APIs, you'll need a developer account with Concur. Get one by signing up [here](https://developer.concur.com). Your account will have a Key and Secret that are needed for SwiftyConcur.

## Authentication

To obtain an access token, you can choose any of the following OAuth strategies:

### Native Flow

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

Once the client is initialized, making requests can be made to the API.

## License

See LICENSE file.

--------

# Implemented Endpoints

## ConnectionRequests

### Get all connection requests - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/ConnectionRequests/Get_offset_limit_status_get_0)
```
var options : [String : AnyObject?] = [
  "Parameters" : [
    "offset" : "string", // Optional
    "limit" : "int", // Optional
    "status" : "string" // Optional
  ]
]
client.connectionRequestsGet(options, callback: { (error, returnValue) in
  if error == nil {
    let connectionRequests = returnValue as! ConcurCollection<ConnectionRequest>
  } else {
    // Handle error
  }
```

### Get a connection request by ID - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/ConnectionRequests/Get_id_get_1)
```
var options : [String : AnyObject?] = [
  "id" : "string" // Required
]
client.connectionRequestsGet(options, callback: { (error, returnValue) in
  if error == nil {
    let connectionRequest = returnValue as! ConcurCollection<ConnectionRequest>
  } else {
    // Handle error
  }
```

### Create a connection request - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/ConnectionRequests/Post_user_post_2)
```
var options : [String : AnyObject?] = [
  "Parameters" : [
    "user" : "string" // Required
  ]
]
client.connectionRequestsPost(options, callback: { (error, returnValue) in
  if error == nil {
    let connectionRequest = returnValue as! ConcurCollection<ConnectionRequest>
  } else {
    // Handle error
  }
})
```

### Update a connection request by ID - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/ConnectionRequests/Put_id_content_put_3)
```
var options : [String : AnyObject?] = [
  "id" : "string", // Required
  "Body" : [
    "Status" : "string" // Required
  ]
]
client.connectionRequestsPut(options, callback: { (error) in
  if error == nil {
    // Update was successful
  } else {
    // Handle error
  }
})
```

### Delete a connection request - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/QuickExpenses/Delete_id_user_delete_4)
```
var options : [String : AnyObject?] = [
  "id" : "string" // Required
]
client.connectionRequestsDelete(options, callback: { (error) in
  if error == nil {
    // Delete was successful
  } else {
    // Handle error
  }
})
```

## Entries

### Get all expense entries - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/Entries/Get_reportID_paymentTypeID_batchID_isBillable_attendeeTypeCode_hasAttendees_hasVAT_expenseTypeCode_attendeeID_offset_limit_user_get_0)
```
var options : [String : AnyObject?] = [
  "Parameters" : [
    "reportID" : "string", // Optional
    "paymentTypeID" : "string", // Optional
    "batchID" : "string", // Optional
    "isBillable" : "boolean", // Optional
    "attendeeTypeCode" : "string", // Optional
    "hasAttendees" : "boolean", // Optional
    "hasVAT" : "boolean", // Optional
    "expenseTypeCode" : "string", // Optional
    "attendeeID" : "string", // Optional
    "offset" : "string", // Optional
    "limit" : "int", // Optional
    "user" : "boolean" // Optional
  ]
]
client.entriesGet(options, callback: { (error, returnValue) in
  if error == nil {
    let entries = returnValue as! ConcurCollection<Entry>
  } else {
    // Handle error
  }
```

### Get a single expense entry by ID - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/Entries/Get_id_user_get_1)
```
var options : [String : AnyObject?] = [
  "id" : "string", // Required
  "Parameters" : [
    "user" : "string" // Optional
  ]
]
client.entriesGet(options, callback: { (error, returnValue) in
  if error == nil {
    let entry = returnValue as! ConcurCollection<Entry>
  } else {
    // Handle error
  }
```

### Create a new expense entry - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/Entries/Post_content_user_post_2)
```
var options : [String : AnyObject?] = [
  "Body" : [
    "Comment" : "string", // Optional
    "Custom1" : "string", // Optional
    "Custom2" : "string", // Optional
    "Custom3" : "string", // Optional
    "Custom4" : "string", // Optional
    "Custom5" : "string", // Optional
    "Custom6" : "string", // Optional
    "Custom7" : "string", // Optional
    "Custom8" : "string", // Optional
    "Custom9" : "string", // Optional
    "Custom10" : "string", // Optional
    "Custom11" : "string", // Optional
    "Custom12" : "string", // Optional
    "Custom13" : "string", // Optional
    "Custom14" : "string", // Optional
    "Custom15" : "string", // Optional
    "Custom16" : "string", // Optional
    "Custom17" : "string", // Optional
    "Custom18" : "string", // Optional
    "Custom19" : "string", // Optional
    "Custom20" : "string", // Optional
    "Custom21" : "string", // Optional
    "Custom22" : "string", // Optional
    "Custom23" : "string", // Optional
    "Custom24" : "string", // Optional
    "Custom25" : "string", // Optional
    "Custom26" : "string", // Optional
    "Custom27" : "string", // Optional
    "Custom28" : "string", // Optional
    "Custom29" : "string", // Optional
    "Custom30" : "string", // Optional
    "Custom31" : "string", // Optional
    "Custom32" : "string", // Optional
    "Custom33" : "string", // Optional
    "Custom34" : "string", // Optional
    "Custom35" : "string", // Optional
    "Custom36" : "string", // Optional
    "Custom37" : "string", // Optional
    "Custom38" : "string", // Optional
    "Custom39" : "string", // Optional
    "Custom40" : "string", // Optional
    "Description" : "string", // Optional
    "ExchangeRate" : "double", // Optional
    "ExpenseTypeCode" : "string", // Required
    "IsBillable" : "boolean", // Optional
    "IsPersonal" : "boolean", // Optional
    "Journey" : [ // Optional
      "BusinessDistance" : "int", // Optional
      "EndLocation" : "string", // Required
      "NumberOfPassengers" : "int", // Optional
      "OdometerEnd" : "int", // Optional
      "OdometerStart" : "int", // Optional
      "PersonalDistance" : "int", // Optional
      "StartLocation" : "string", // Required
      "UnitOfMeasure" : "string", // Required
      "VehicleID" : "string" // Optional
    ],
    "LocationID" : "string", // Optional
    "OrgUnit1" : "string", // Optional
    "OrgUnit2" : "string", // Optional
    "OrgUnit3" : "string", // Optional
    "OrgUnit4" : "string", // Optional
    "OrgUnit5" : "string", // Optional
    "OrgUnit6" : "string", // Optional
    "PaymentTypeID" : "string", // Optional
    "ReportID" : "string", // Required
    "TaxReceiptType" : "string", // Optional
    "TransactionAmount" : "double", // Optional
    "TransactionCurrencyCode" : "string", // Optional
    "TransactionDate" : "datetime", // Required
    "VendorDescription" : "string", // Optional
    "VendorListItemID" : "string" // Optional
  ],
  "Parameters" : [
    "user" : "string" // Optional
  ]
]
client.entriesPost(options, callback: { (error, returnValue) in
  if error == nil {
    let entry = returnValue as! ConcurCollection<Entry>
  } else {
    // Handle error
  }
})
```

### Update an expense entry by ID - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/Entries/Put_id_content_user_put_3)
###### Note: At least one of the parameters in Body must be provided
```
var options : [String : AnyObject?] = [
  "id" : "string", // Required
  "Body" : [
    "Comment" : "string", // Optional
    "Custom1" : "string", // Optional
    "Custom2" : "string", // Optional
    "Custom3" : "string", // Optional
    "Custom4" : "string", // Optional
    "Custom5" : "string", // Optional
    "Custom6" : "string", // Optional
    "Custom7" : "string", // Optional
    "Custom8" : "string", // Optional
    "Custom9" : "string", // Optional
    "Custom10" : "string", // Optional
    "Custom11" : "string", // Optional
    "Custom12" : "string", // Optional
    "Custom13" : "string", // Optional
    "Custom14" : "string", // Optional
    "Custom15" : "string", // Optional
    "Custom16" : "string", // Optional
    "Custom17" : "string", // Optional
    "Custom18" : "string", // Optional
    "Custom19" : "string", // Optional
    "Custom20" : "string", // Optional
    "Custom21" : "string", // Optional
    "Custom22" : "string", // Optional
    "Custom23" : "string", // Optional
    "Custom24" : "string", // Optional
    "Custom25" : "string", // Optional
    "Custom26" : "string", // Optional
    "Custom27" : "string", // Optional
    "Custom28" : "string", // Optional
    "Custom29" : "string", // Optional
    "Custom30" : "string", // Optional
    "Custom31" : "string", // Optional
    "Custom32" : "string", // Optional
    "Custom33" : "string", // Optional
    "Custom34" : "string", // Optional
    "Custom35" : "string", // Optional
    "Custom36" : "string", // Optional
    "Custom37" : "string", // Optional
    "Custom38" : "string", // Optional
    "Custom39" : "string", // Optional
    "Custom40" : "string", // Optional
    "Description" : "string", // Optional
    "ExchangeRate" : "double", // Optional
    "ExpenseTypeCode" : "string", // Optional
    "IsBillable" : "boolean", // Optional
    "IsPersonal" : "boolean", // Optional
    "Journey" : [ // Optional
      "BusinessDistance" : "int", // Optional
      "EndLocation" : "string", // Optional
      "NumberOfPassengers" : "int", // Optional
      "OdometerEnd" : "int", // Optional
      "OdometerStart" : "int", // Optional
      "PersonalDistance" : "int", // Optional
      "StartLocation" : "string", // Optional
      "UnitOfMeasure" : "string", // Optional
      "VehicleID" : "string" // Optional
    ],
    "LocationID" : "string", // Optional
    "OrgUnit1" : "string", // Optional
    "OrgUnit2" : "string", // Optional
    "OrgUnit3" : "string", // Optional
    "OrgUnit4" : "string", // Optional
    "OrgUnit5" : "string", // Optional
    "OrgUnit6" : "string", // Optional
    "PaymentTypeID" : "string", // Optional
    "ReportID" : "string", // Optional
    "TaxReceiptType" : "string", // Optional
    "TransactionAmount" : "double", // Optional
    "TransactionCurrencyCode" : "string", // Optional
    "TransactionDate" : "datetime", // Optional
    "VendorDescription" : "string", // Optional
    "VendorListItemID" : "string" // Optional
  ],
  "Parameters" : [
    "user" : "string" // Optional
  ]
]
client.entriessPut(options, callback: { (error) in
  if error == nil {
    // Update was successful
  } else {
    // Handle error
  }
})
```

### Delete an expense entry by ID - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/Entries/Delete_id_user_delete_4)
```
var options : [String : AnyObject?] = [
  "id" : "string", // Required
  "Parameters" : [
    "user" : "string" // Optional
  ]
]
client.entriesDelete(options, callback: { (error) in
  if error == nil {
    // Delete was successful
  } else {
    // Handle error
  }
})
```

## EntryAttendeeAssociations

### Get all entry-attendee associations - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/EntryAttendeeAssociations/Get_entryID_offset_limit_user_get_0)
```
var options : [String : AnyObject?] = [
  "Parameters" : [
    "entryID" : "string", // Optional
    "offset" : "string", // Optional
    "limit" : "int", // Optional
    "user" : "string" // Optional
  ]
]
client.entryAttendeeAssociationsGet(options, callback: { (error, returnValue) in
  if error == nil {
    let entryAttendeeAssociations = returnValue as! ConcurCollection<EntryAttendeeAssociation>
  } else {
    // Handle error
  }
```

### Get a single entry-attendee association by ID - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/EntryAttendeeAssociations/Get_id_user_get_1)
```
var options : [String : AnyObject?] = [
  "id" : "string", // Required
  "Parameters" : [
    "user" : "string" // Optional
  ]
]
client.entryAttendeeAssociationsGet(options, callback: { (error, returnValue) in
  if error == nil {
    let entryAttendeeAssociation = returnValue as! ConcurCollection<EntryAttendeeAssociations>
  } else {
    // Handle error
  }
```

### Create a new entry attendee-association - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/EntryAttendeeAssociations/Post_content_user_post_2)
```
var options : [String : AnyObject?] = [
  "Body" : [
    "Amount" : "double", // Optional
    "AssociatedAttendeeCount" : "int", // Optional
    "AttendeeID" : "string", // Required
    "Custom1" : "string", // Optional
    "Custom2" : "string", // Optional
    "Custom3" : "string", // Optional
    "Custom4" : "string", // Optional
    "Custom5" : "string", // Optional
    "EntryID" : "string" // Required
  ],
  "Parameters" : [
    "user" : "string" // Optional
  ]
]
client.entryAttendeeAssociationsPost(options, callback: { (error, returnValue) in
  if error == nil {
    let entryAttendeeAssociation = returnValue as! ConcurCollection<EntryAttendeeAssociation>
  } else {
    // Handle error
  }
})
```

### Update an entry-attendee association by ID - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/EntryAttendeeAssociations/Put_id_content_user_put_3)
###### Note: At least one of the parameters in Body must be provided
```
var options : [String : AnyObject?] = [
  "id" : "string", // Required
  "Body" : [
    "Amount" : "double", // Optional
    "AssociatedAttendeeCount" : "int", // Optional
    "AttendeeID" : "string", // Optional
    "Custom1" : "string", // Optional
    "Custom2" : "string", // Optional
    "Custom3" : "string", // Optional
    "Custom4" : "string", // Optional
    "Custom5" : "string", // Optional
    "EntryID" : "string" // Optional
  ],
  "Parameters" : [
    "user" : "string" // Optional
  ]
]
client.entryAttendeeAssociationsPut(options, callback: { (error) in
  if error == nil {
    // Update was successful
  } else {
    // Handle error
  }
})
```

### Delete an entry-attendee association by ID - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/EntryAttendeeAssociations/Delete_id_user_delete_4)
```
var options : [String : AnyObject?] = [
  "id" : "string", // Required
  "Parameters" : [
    "user" : "string" // Optional
  ]
]
client.entryAttendeeAssociationsDelete(options, callback: { (error) in
  if error == nil {
    // Delete was successful
  } else {
    // Handle error
  }
})
```

## QuickExpenses

### Get all quick expenses - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/QuickExpenses/Get_offset_limit_user_get_0)
```
var options : [String : AnyObject?] = [
  "Parameters" : [
    "offset" : "string", // Optional
    "limit" : "int", // Optional
    "user" : "string" // Optional
  ]
]
client.quickExpensesGet(options, callback: { (error, returnValue) in
  if error == nil {
    let quickExpenses = returnValue as! ConcurCollection<QuickExpense>
  } else {
    // Handle error
  }
```

### Get a single quick expense by ID - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/QuickExpenses/Get_id_user_get_1)
```
var options : [String : AnyObject?] = [
  "id" : "string", // Required
  "Parameters" : [
    "user" : "string" // Optional
  ]
]
client.quickExpensesGet(options, callback: { (error, returnValue) in
  if error == nil {
    let quickExpense = returnValue as! ConcurCollection<QuickExpense>
  } else {
    // Handle error
  }
```

### Create a new quick expense - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/QuickExpenses/Post_content_user_post_2)
```
var options : [String : AnyObject?] = [
  "Body" : [
    "Comment" : "string", // Optional
    "CurrencyCode" : "string", // Required
    "ExpenseTypeCode" : "string", // Optional
    "LocationCity" : "string", // Optional
    "LocationCountry" : "string", // Optional
    "LocationSubdivision" : "string", // Optional
    "PaymentTypeCode" : "string", // Optional
    "ReceiptImageID" : "string", // Optional
    "SpendCategoryCode" : "string", // Optional
    "TransactionAmount" : "double", // Required
    "TransactionDate" : "datetime", // Required
    "VendorDescription" : "string" // Optional
  ],
  "Parameters" : [
    "user" : "string" // Optional
  ]
]
client.quickExpensesPost(options, callback: { (error, returnValue) in
  if error == nil {
    let expense = returnValue as! ConcurCollection<QuickExpense>
  } else {
    // Handle error
  }
})
```

### Update a quick expense by ID - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/QuickExpenses/Put_id_content_user_put_3)
###### Note: At least one of the parameters in Body must be provided
```
var options : [String : AnyObject?] = [
  "id" : "string", // Required
  "Body" : [
    "Comment" : "string", // Optional
    "CurrencyCode" : "string", // Optional
    "ExpenseTypeCode" : "string", // Optional
    "LocationCity" : "string", // Optional
    "LocationCountry" : "string", // Optional
    "LocationSubdivision" : "string", // Optional
    "PaymentTypeCode" : "string", // Optional
    "ReceiptImageID" : "string", // Optional
    "SpendCategoryCode" : "string", // Optional
    "TransactionAmount" : "double", // Optional
    "TransactionDate" : "datetime", // Optional
    "VendorDescription" : "string" // Optional
  ],
  "Parameters" : [
    "user" : "string" // Optional
  ]
]
client.quickExpensesPut(options, callback: { (error) in
  if error == nil {
    // Update was successful
  } else {
    // Handle error
  }
})
```

### Delete a quick expense by ID - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/QuickExpenses/Delete_id_user_delete_4)
```
var options : [String : AnyObject?] = [
  "id" : "string", // Required
  "Parameters" : [
    "user" : "string" // Optional
  ]
]
client.quickExpensesDelete(options, callback: { (error) in
  if error == nil {
    // Delete was successful
  } else {
    // Handle error
  }
})
```
