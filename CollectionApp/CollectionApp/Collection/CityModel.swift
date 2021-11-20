import UIKit

struct City {
    var image: String = ""
    var name: String = ""
    var description: String = ""
}

extension City {
    static var cities : [City] = [ City(image: "Moscow", name: "Moscow", description: "Какова красота в Москве"),
                                         City(image: "Saint Petersburg", name: "Saint Petersburg", description: "Какова красота в Питере"),
                                         City(image: "Sochi", name: "Sochi", description: "Какова красота в Сочи"),
                                         City(image: "Vladimir", name: "Vladimir", description: "Какова красота в Москве"),
                                         City(image: "Rostov-na-Donu", name: "Rostov-na-Donu", description: "Какова красота в Ростове"),
                                         City(image: "Kazan", name: "Kazan", description: "Какова красота в Казани"),
                                         City(image: "Kaliningrad", name: "Kaliningrad", description: "Какова красота в Калининграде"),
                                         City(image: "Ekaterinburg", name: "Ekaterinburg", description: "Какова красота в Екатеринбурге"),
                                         City(image: "Arkhangelsk", name: "Arkhangelsk", description: "Какова красота в Архангельске"),City(image: "Nizhny_Novgorod", name: "Nizhny_Novgorod", description: "Какова красота в Нижнем Новгороде")]
}
