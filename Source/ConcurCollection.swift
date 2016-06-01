import SwiftyJSON
import Alamofire

public class ConcurCollection<T: ConcurObject> {
  
  public var Items: [T]!
  public var NextPage: String!
  
  internal init(json: JSON) {
    var objects: [T] = []
    if json["Items"] != nil {
      for (index, subJson) : (String, JSON) in json["Items"] {
        var object = T(json: subJson)
        objects.append(object)
      }
    } else {
      var object = T(json: json)
      objects.append(object)
    }
    self.Items = objects
    self.NextPage = json["NextPage"].string
  }
  
  public func getMoreItems(callback: (moreItems: ConcurCollection<T>!) -> Void) {
    if self.NextPage != nil {
      let request = ConcurClient.getMoreItems(self.NextPage)
      Alamofire.request(request).responseJSON { response in
        if let json = response.result.value {
          var jsonObject = JSON(json)
          var newCollection = ConcurCollection<T>(json: jsonObject)
          callback(moreItems: newCollection)
        }
      }
    } else {
      callback(moreItems: nil)
    }
  }
  
}

public protocol ConcurObject {
  
  init(json: JSON)
  
}