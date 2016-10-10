import SwiftyJSON
import Alamofire

public class ConcurCollection<T: ConcurObject> {
  
  public var Items: [T]!
  public var NextPage: String!
  
  internal init(json: JSON) {
    var objects: [T] = []
    if json["Items"] != nil {
      for (_, subJson) : (String, JSON) in json["Items"] {
        let object = T(json: subJson)
        objects.append(object)
      }
    } else {
      let object = T(json: json)
      objects.append(object)
    }
    self.Items = objects
    self.NextPage = json["NextPage"].string
  }
  
  public func getMoreItems() -> ConcurCollection<T>? {
    if self.NextPage != nil {
      let request = ConcurClient.getMoreItems(self.NextPage)
      Alamofire.request(request).responseJSON { response in
        if let json = response.result.value {
          var jsonObject = JSON(json)
          var newCollection = ConcurCollection<T>(json: jsonObject)
          return newCollection
        }
      }
    } else {
      return nil
    }
  }
  
}

public protocol ConcurObject {
  
  init(json: JSON)
  
}
