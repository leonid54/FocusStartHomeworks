import UIKit

class HobbieViewModel {
    private let model = HobbieModel()

    var data: Observable<HobbieModel.HobbieScreenContent> = Observable<HobbieModel.HobbieScreenContent>(HobbieModel.HobbieScreenContent.init())

    init() {
        self.updateHobbieModel()
    }

    func updateHobbieModel() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) { [weak self] in
            self?.model.getHobbieText()
            DispatchQueue.main.async { [weak self] in
                let viewData = self?.model.getHobbieText()
                self?.data.data = viewData ?? HobbieModel.HobbieScreenContent.init()
            }
        }
    }
}
