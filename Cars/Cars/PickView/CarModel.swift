import UIKit

struct Car {
    var image: String
    var name: String
}

extension Car {
    static var cars : [Car] = [ Car(image: "BMW", name: "BMW"),Car(image: "AUDI", name: "AUDI"),Car(image: "HONDA", name: "HONDA"),Car(image: "BMW", name: "BMW"),Car(image: "BMW", name: "BMW")]
}
