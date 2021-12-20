import UIKit
import RealmSwift

class Company: Object {
    @Persisted var name: String
    @Persisted var id = NSUUID().uuidString
}
