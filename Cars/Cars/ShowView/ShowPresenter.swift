import UIKit

protocol IShowPresenter {
    func loadView(controller: ShowViewController, view: IShowView)
}

final class ShowPresenter {
    private var model = ShowModel()
    private weak var controller: ShowViewController?
    private var view: IShowView?
    private let router: ShowRouter
    private let car: String?

    init(router: ShowRouter, car: String) {
        self.router = router
        self.car = car
    }
}

private extension ShowPresenter {
    
    private func setDefaultCar() {
        guard let newCar = self.car else {
            return
        }
        
        self.view?.setDefaultCar(defaultCar: newCar)
    }
    
    private func onCarButtonTouched(type: String) {
        guard let someCar = self.car else {
            return
        }
        
        if someCar == "BMW" {
            let typeOfCars = model.bmw
            for (key, value) in typeOfCars {
                if key == type {
                    self.view?.setCurrentCar(currentCar: value)
                }
            }
        } else if someCar == "HONDA" {
            let typeOfCars = model.honda
            for (key, value) in typeOfCars {
                if key == type {
                    self.view?.setCurrentCar(currentCar: value)
                }
            }
        } else if someCar == "MERCEDES" {
            let typeOfCars = model.mercedes
            for (key, value) in typeOfCars {
                if key == type {
                    self.view?.setCurrentCar(currentCar: value)
                }
            }
        } else if someCar == "TOYOTA" {
            let typeOfCars = model.toyota
            for (key, value) in typeOfCars {
                if key == type {
                    self.view?.setCurrentCar(currentCar: value)
                }
            }
        } else if someCar == "AUDI" {
            let typeOfCars = model.audi
            for (key, value) in typeOfCars {
                if key == type {
                    self.view?.setCurrentCar(currentCar: value)
                }
            }
        }
    }
    
    private func onPriceButtonTouched(data: String) {
        guard let view = view else {
            return
        }
        self.view?.showActivityIndicator()
        let car = model.priceOfCars
        for (key, value) in car {
            if key == data {
                self.view?.update(price: value)
            }
        }
    }

    private func setCarButtonHandlers() {
        self.view?.onTouchedCarButtonHandler = { [weak self] model in
            self?.onCarButtonTouched(type: model)
        }
    }
    
    private func setPriceButtonHandler() {
        self.view?.onTouchedGetPriceHandler = { [weak self] model in
            self?.onPriceButtonTouched(data: model)
        }
    }
    
    private func presentShowText() {
        let modelData = self.model.getShowText()
        let presentData = ShowPresentModel(priceTopLabelText: "\(modelData.priceTopLabel)", priceBottomLabelText: "\(modelData.priceBottomLabel)", typeCarLabelText: "\(modelData.typeCarLabel)", sedanButtonText: "\(modelData.sedanButton)", universalButtonText: "\(modelData.universalButton)", cabrioletButtonText: "\(modelData.cabrioletButton)", furgonButtonText: "\(modelData.furgonButton)", calculatePriceButtonText: "\(modelData.calculatePriceButton)")
        self.view?.setShowContent(model: presentData)
    }
}

extension ShowPresenter: IShowPresenter {
    func loadView(controller: ShowViewController, view: IShowView) {
        self.controller = controller
        self.view = view
        self.setDefaultCar()
        self.presentShowText()
        self.setPriceButtonHandler()
        self.setCarButtonHandlers()
    }
}

