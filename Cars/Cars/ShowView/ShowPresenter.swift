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

private extension PickPresenter
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
    
//    func presentPickText() {
//        let modelData = self.model.getPickText()
//        let presentData = PickPresentModel(presentPickLabelText: "\(modelData.pickLabelText)", presentCarLabelText: "\(modelData.carLabelText)")
//        self.view?.setPickContent(model: presentData)
//    }
}

extension ShowPresenter: IShowPresenter
{
    func loadView(controller: ShowViewController, view: IShowView) {
        self.controller = controller
        self.view = view
//        self.presentPickText()
//        self.setHandlers()
    }
}

