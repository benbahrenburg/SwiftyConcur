import SwiftyJSON
import Alamofire

public class ConcurCollection<T: ConcurObject> {
  
  public var items: [T]!
  public var nextPage: String!
  
  internal init(json: JSON) {
    var objects: [T] = []
    for (index: String, subJson: JSON) in json["Items"] {
      var object = T(json: subJson)
      objects.append(object)
    }
    self.items = objects
    self.nextPage = json["NextPage"].string
  }
  
  public func getMoreItems(callback: (moreItems: ConcurCollection<T>!) -> Void) {
    if self.nextPage != nil {
      let request = ConcurClient.getMoreItems(self.nextPage)
      Alamofire.request(request).responseJSON { (req, res, json, error) in
        var jsonObject = JSON(json!)
        var newCollection = ConcurCollection<T>(json: jsonObject)
        callback(moreItems: newCollection)
      }
    } else {
      callback(moreItems: nil)
    }
  }
  
}

public protocol ConcurObject {
  
  init(json: JSON)
  
}