import UIKit
import RealmSwift

class Employee: Object {
    @Persisted var name: String
    @Persisted var age: String
    @Persisted var experience: String?
    @Persisted var company: Company?
}
