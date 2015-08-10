# SwiftyConcur [![Build Status](https://travis-ci.org/concurlabs/SwiftyConcur.svg?branch=master)](https://travis-ci.org/concurlabs/SwiftyConcur)

Swift SDK for the Concur APIs.

## Setup

To get started with SwiftyConcur, you can add it your project using CocoaPods:

```
platform :ios, '8.0'
use_frameworks!

pod 'SwiftyConcur'
``` 

## Tests

To run unit tests on SwiftyConcur, open the SwiftyConcuriOSExample workspace and run one of the following commands:

- `Product -> Test`
- `CMD + U`

## Getting Access to Concur APIs

To get access to Concur's APIs, you'll need a developer account with Concur. Get one by signing up [here](https://developer.concur.com). Your account will have a Key and Secret that are needed for SwiftyConcur.

## Authentication

To use Concur's API, you must retrieve an access token. You can choose any of the following OAuth strategies to obtain and store an access token:

### Native Flow

```
var client = ConcurClient(consumerKey: "CONSUMER_KEY", consumerSecret: "CONSUMER_SECRET")
client.getNativeFlowAccessToken("USERNAME", password: "PASSWORD", callback: { (error, token) in
  if error != nil {
    // Handle error
  } else {
    // Do something with ConcurAccessToken
  }
})
```

## Making Requests

To make requests to Concur's API, your ConcurClient must contain an access token.

##### If a ConcurClient has already been created, obtain a token using one of the Oauth flows above. Then, add it to your ConcurClient:
```
client.setAccessToken(token)
```

##### If you have a token and are creating a new ConcurClient, you can initialize it with a ConcurAccessToken object:
```
var token = functionThatLoadsConcurAccessToken()
var client = ConcurClient(consumerKey: "CONSUMER_KEY", consumerSecret: "CONSUMER_SECRET", accessToken: token)
```

##### You can also create a ConcurAccessToken with just the access token string, but this will limit some functions available for the ConcurAccessToken:
```
var token = ConcurAccessToken(accessTokenString: functionThatLoadsAccessTokenString())
```

Once the client is initialized, making requests can be made to the API.

## Refreshing Access Tokens

If you need to refresh your access token and obtain a new one, you must have a ConcurClient with a ConcurAccessToken that contains a RefreshToken:

```
client.refreshToken({ (error, token) in
  if error != nil {
    // Handle error
  } else {
    // Do something with ConcurAccessToken
  }
})
```

This will invalidate your previous access token.

## License

See LICENSE file.

--------

# Implemented Endpoints

## AttendeeTypes

### Get all attendee types - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/AttendeeTypes/Get_offset_limit_get_0)
```
var options : [String : AnyObject?] = [
  "Parameters" : [
    "offset" : "string", // Optional
    "limit" : "int" // Optional
  ]
]
client.attendeeTypesGet(options, callback: { (error, returnValue) in
  if error == nil {
    // returnValue is of type ConcurCollection<AttendeeType>!
  } else {
    // error is of type String!
  }
})
```

### Get a single attendee type by ID - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/AttendeeTypes/Get_id_get_1)
```
var options : [String : AnyObject?] = [
  "id" : "string" // Required
]
client.attendeeTypesGet(options, callback: { (error, returnValue) in
  if error == nil {
    // returnValue is of type ConcurCollection<AttendeeType>!
  } else {
    // error is of type String!
  }
})
```

### Delete an attendee type by ID - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/AttendeeTypes/Delete_id_delete_2)
```
var options : [String : AnyObject?] = [
  "id" : "string" // Required
]
client.attendeeTypesDelete(options, callback: { (error, returnValue) in
  if error == nil {
    // returnValue is of type ConcurCollection<AttendeeType>!
  } else {
    // error is of type String!
  }
})
```

### Create a new attendee type - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/AttendeeTypes/Post_content_post_3)
```
var options = [String : AnyObject?] = [
  "Body" : [
    "AllowAttendeeCountEditing" : "boolean", // Optional
    "AllowManuallyEnteredAttendees" : "boolean", // Optional
    "AttendeeFormID" : "string", // Required
    "Code" : "string", // Required
    "ConnectorID" : "string", // Optional
    "DuplicateSearchFields" : [
      "string", "string", "string" // Required
    ],
    "Name" : "string" // Required
  ]
]
client.attendeeTypesPost(options, callback: { (error, returnValue) in
  if error == nil {
    // returnValue is of type ConcurCollection<AttendeeType>!
  } else {
    // error is of type String!
  }
})
```

### Update an attendee type by ID
###### Note: At least one of the parameters in Body must be provided
```
var options = [String : AnyObject?] = [
  "id" : "string", // Required
  "Body" : [
    "AllowAttendeeCountEditing" : "boolean", // Optional
    "AllowManuallyEnteredAttendees" : "boolean", // Optional
    "AttendeeFormID" : "string", // Optional
    "Code" : "string", // Optional
    "ConnectorID" : "string", // Optional
    "DuplicateSearchFields" : [
      "string", "string", "string" // Optional
    ],
    "Name" : "string" // Required
  ]
]
client.attendeeTypesPut(options, callback: { (error, returnValue) in
  if error == nil {
    // returnValue is of type ConcurCollection<AttendeeType>!
  } else {
    // error is of type String!
  }
})
```

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
    // returnValue is of type ConcurCollection<ConnectionRequest>!
  } else {
    // error is of type String!
  }
})
```

### Get a connection request by ID - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/ConnectionRequests/Get_id_get_1)
```
var options : [String : AnyObject?] = [
  "id" : "string" // Required
]
client.connectionRequestsGet(options, callback: { (error, returnValue) in
  if error == nil {
    // returnValue is of type ConcurCollection<ConnectionRequest>!
  } else {
    // error is of type String!
  }
})
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
    // returnValue is of type ConcurCollection<ConnectionRequest>!
  } else {
    // error is of type String!
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
client.connectionRequestsPut(options, callback: { (error, returnValue) in
  if error == nil {
    // returnValue is of type ConcurCollection<ConnectionRequest>!
  } else {
    // error is of type String!
  }
})
```

### Delete a connection request - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/QuickExpenses/Delete_id_user_delete_4)
```
var options : [String : AnyObject?] = [
  "id" : "string" // Required
]
client.connectionRequestsDelete(options, callback: { (error, returnValue) in
  if error == nil {
    // returnValue is of type ConcurCollection<ConnectionRequest>!
  } else {
    // error is of type String!
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
    // returnValue is of type ConcurCollection<Entry>!
  } else {
    // error is of type String!
  }
})
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
    // returnValue is of type ConcurCollection<Entry>!
  } else {
    // error is of type String!
  }
})
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
    // returnValue is of type ConcurCollection<Entry>!
  } else {
    // error is of type String!
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
client.entriesPut(options, callback: { (error, returnValue) in
  if error == nil {
    // returnValue is of type ConcurCollection<Entry>!
  } else {
    // error is of type String!
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
client.entriesDelete(options, callback: { (error, returnValue) in
  if error == nil {
    // returnValue is of type ConcurCollection<Entry>!
  } else {
    // error is of type String!
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
    // returnValue is of type ConcurCollection<EntryAttendeeAssociation>!
  } else {
    // error is of type String!
  }
})
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
    // returnValue is of type ConcurCollection<EntryAttendeeAssociation>!
  } else {
    // error is of type String!
  }
})
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
    // returnValue is of type ConcurCollection<EntryAttendeeAssociation>!
  } else {
    // error is of type String!
  }
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
client.entryAttendeeAssociationsPut(options, callback: { (error, returnValue) in
  if error == nil {
    // returnValue is of type ConcurCollection<EntryAttendeeAssociation>!
  } else {
    // error is of type String!
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
client.entryAttendeeAssociationsDelete(options, callback: { (error, returnValue) in
  if error == nil {
    // returnValue is of type ConcurCollection<EntryAttendeeAssociation>!
  } else {
    // error is of type String!
  }
})
```

## ExpenseGroupConfigurations

### Get an expense group configuration - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/ExpenseGroupConfigurations/Get_user_offset_limit_get_0)
```
var options : [String : AnyObject?] = [
  "Parameters" : [
    "user" : "string", // Optional
    "offset" : "string", // Optional
    "limit" : "int" // Optional
  ]
]
client.expenseGroupConfigurationsGet(options, callback: { (error, returnValue) in
  if error == nil {
    // returnValue is of type ConcurCollection<ExpenseGroupConfiguration>!
  } else {
    // error is of type String!
  }
})
```

### Get an expense group configuration by ID - [Swagger](https://www.concursolutions.com/api/docs/index.html#!/ExpenseGroupConfigurations/Get_id_user_get_1)
```
var options : [String : AnyObject?] = [
  "id" : "string", // Required
  "Parameters" : [
    "user" : "string" // Optional
  ]
]
client.expenseGroupConfigurationsGet(options, callback: { (error, returnValue) in
  if error == nil {
    // returnValue is of type ConcurCollection<ExpenseGroupConfiguration>!
  } else {
    // error is of type String!
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
    // returnValue is of type ConcurCollection<QuickExpense>!
  } else {
    // error is of type String!
  }
})
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
    // returnValue is of type ConcurCollection<QuickExpense>!
  } else {
    // error is of type String!
  }
})
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
    // returnValue is of type ConcurCollection<QuickExpense>!
  } else {
    // error is of type String!
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
client.quickExpensesPut(options, callback: { (error, returnValue) in
  if error == nil {
    // returnValue is of type ConcurCollection<QuickExpense>!
  } else {
    // error is of type String!
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
client.quickExpensesDelete(options, callback: { (error, returnValue) in
  if error == nil {
    // returnValue is of type ConcurCollection<QuickExpense>!
  } else {
    // error is of type String!
  }
})
```
