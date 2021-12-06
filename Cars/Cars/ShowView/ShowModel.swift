import UIKit

final class ShowModel {
    
    struct ShowScreenContent {
        let priceTopLabel = "Цена"
        let priceBottomLabel = "100000"
        let typeCarLabel = "Выберите тип кузова"
        let sedanButton = "Седан"
        let universalButton = "Универсал"
        let cabrioletButton = "Кабриолет"
        let furgonButton = "Паркетник"
        let calculatePriceButton = "Рассчитать цену"
    }
    
    func getShowText() -> ShowScreenContent {
        ShowScreenContent()
    }
}
