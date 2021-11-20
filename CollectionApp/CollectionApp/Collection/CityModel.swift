import UIKit

struct City {
    var image: String = ""
    var name: String = ""
    var description: String = ""
}

extension City
{
    static var cities : [City] = [ City(image: "Moscow", name: "Moscow", description: "Какова красота в Москве"),
                                         City(image: "Saint Petersburg", name: "Saint Petersburg", description: "Какова красота в Питере"),
                                         City(image: "Sochi", name: "Sochi"),
                                         City(image: "Vladimir", name: "Vladimir"),
                                         City(image: "Rostov-na-Donu", name: "Rostov-na-Donu"),
                                         City(image: "Kazan", name: "Kazan"),
                                         City(image: "Kaliningrad", name: "Kaliningrad"),
                                         City(image: "Ekaterinburg", name: "Ekaterinburg"),
                                         City(image: "Arkhangelsk", name: "Arkhangelsk"),City(image: "Nizhny_Novgorod", name: "Nizhny_Novgorod")]
}
