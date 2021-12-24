import UIKit
import RealmSwift

class Employee: Object {
    @Persisted var name: String
    @Persisted var age: Int
    @Persisted var experience: String?
    @Persisted var companyID: String
}
