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
    
    func getShowText() -> ShowScreenContent {
        ShowScreenContent()
    }
}
