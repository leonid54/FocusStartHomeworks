import UIKit

struct Car {
    var name = ""
}

extension Car {
    static var cars : [Car] = [ Car(name: "BMW"),Car(name: "AUDI"),Car(name: "HONDA"),Car(name: "TOYOTA"),Car(name: "MERCEDES")]
}
