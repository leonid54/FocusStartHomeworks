import UIKit

struct Car {
    var image = ""
    var name = ""
}

extension Car {
    static var cars : [Car] = [ Car(image: "BMW", name: "BMW"),Car(image: "AUDI", name: "AUDI"),Car(image: "HONDA", name: "HONDA"),Car(image: "TOYOTA", name: "TOYOTA"),Car(image: "MERCEDES", name: "MERCEDES")]
}
