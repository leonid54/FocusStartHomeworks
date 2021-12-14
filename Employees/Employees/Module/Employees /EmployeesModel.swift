import UIKit
import RealmSwift

class Dog: Object {
    @Persisted var name: String
    @Persisted var age: Int
}
class Person: Object {
    @Persisted(primaryKey: true) var _id: String
    @Persisted var name: String
    @Persisted var age: Int
    // Create relationships by pointing an Object field to another Class
    @Persisted var dogs: List<Dog>
}
