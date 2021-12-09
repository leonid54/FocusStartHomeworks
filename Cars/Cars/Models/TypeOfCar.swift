import UIKit

struct TypeCars {
    var name = ""
    var type = ""
    var image = ""
}

extension TypeCars {
    static var types : [TypeCars] = [
        TypeCars(name: "BMW", type: "sedan", image: "BMW"),TypeCars(name: "BMW", type: "cabr", image: "BMW_CABR"),TypeCars(name: "BMW", type: "univ", image: "BMW_UNIV"),TypeCars(name: "BMW", type: "furgon", image: "BMW_FURG"),
        TypeCars(name: "AUDI", type: "sedan", image: "AUDI"),TypeCars(name: "AUDI", type: "cabr", image: "AUDI_CABR"),TypeCars(name: "AUDI", type: "univ", image: "AUDI_UNIV"),TypeCars(name: "AUDI", type: "furgon", image: "AUDI_FURG"),
        TypeCars(name: "HONDA", type: "sedan", image: "HONDA"),TypeCars(name: "HONDA", type: "cabr", image: "HONDA_CABR"),TypeCars(name: "HONDA", type: "univ", image: "HONDA_UNIV"),TypeCars(name: "HONDA", type: "furgon", image: "HONDA_FURG"),
        TypeCars(name: "TOYOTA", type: "sedan", image: "TOYOTA"),TypeCars(name: "TOYOTA", type: "cabr", image: "TOYOTA_CABR"),TypeCars(name: "TOYOTA", type: "univ", image: "TOYOTA_UNIV"),TypeCars(name: "TOYOTA", type: "furgon", image: "TOYOTA_FURG"),
        TypeCars(name: "MERCEDES", type: "sedan", image: "MERCEDES"),TypeCars(name: "MERCEDES", type: "cabr", image: "MERC_CABR"),TypeCars(name: "MERCEDES", type: "univ", image: "MERC_UNIV"),TypeCars(name: "MERCEDES", type: "furgon", image: "MERC_FURG")]
}
