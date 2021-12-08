import UIKit

final class ShowModel {
    
    struct ShowScreenContent {
        let priceTopLabel = "Цена"
        let priceBottomLabel = "******"
        let typeCarLabel = "Выберите тип кузова"
        let sedanButton = "Седан"
        let universalButton = "Универсал"
        let cabrioletButton = "Кабриолет"
        let furgonButton = "Паркетник"
        let calculatePriceButton = "Рассчитать цену"
    }
    
    var priceOfCars: [String: String] = ["sedan": "100000$", "univ":"105000$", "cabr":"115000$", "furgon":"102000$"]
    var bmw: [String: String] = ["sedan": "BMW", "cabr": "BMW_CABR","univ": "BMW_UNIV","furgon": "BMW_FURG"]
    var audi: [String: String] = ["sedan": "AUDI", "cabr": "AUDI_CABR","univ": "AUDI_UNIV","furgon": "AUDI_FURG"]
    var honda: [String: String] = ["sedan": "HONDA", "cabr": "HONDA_CABR","univ": "HONDA_UNIV","furgon": "HONDA_FURG"]
    var toyota: [String: String] = ["sedan": "TOYOTA", "cabr": "TOYOTA_CABR","univ": "TOYOTA_UNIV","furgon": "TOYOTA_FURG"]
    var mercedes: [String: String] = ["sedan": "MERCEDES", "cabr": "MERC_CABR","univ": "MERC_UNIV","furgon": "MERC_FURG"]
    
    func getShowText() -> ShowScreenContent {
        ShowScreenContent()
    }
}
