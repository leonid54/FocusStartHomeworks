import UIKit

protocol IShowPresenter {
    func loadView(controller: ShowViewController, view: IShowView)
}

final class ShowPresenter {
    private var model = ShowModel()
    private weak var controller: ShowViewController?
    private var view: IShowView?
    private let router: ShowRouter

    init(router: ShowRouter, car: String) {
        self.router = router
    }
}

private extension ShowPresenter
{
//    private func onTouched() {
//        guard let view = view else {
//            return
//        }
//        self.view?.touched()
//        self.router.next()
//    }

//    private func setHandlers() {
//    }
    
    func presentShowText() {
        let modelData = self.model.getShowText()
        let presentData = ShowPresentModel(priceTopLabelText: "\(modelData.priceTopLabel)", priceBottomLabelText: "\(modelData.priceBottomLabel)", typeCarLabelText: "\(modelData.typeCarLabel)", sedanButtonText: "\(modelData.sedanButton)", universalButtonText: "\(modelData.universalButton)", cabrioletButtonText: "\(modelData.cabrioletButton)", furgonButtonText: "\(modelData.furgonButton)", calculatePriceButtonText: "\(modelData.calculatePriceButton)")
        self.view?.setShowContent(model: presentData)
    }
}

extension ShowPresenter: IShowPresenter {
    func loadView(controller: ShowViewController, view: IShowView) {
        self.controller = controller
        self.view = view
        self.presentShowText()
    }
}

