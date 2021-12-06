import UIKit

protocol IPickPresenter {
    func loadView(controller: PickViewController, view: IPickView)
}

final class PickPresenter {
    private var model = PickModel()
    private weak var controller: PickViewController?
    private var view: IPickView?
    private let router: PickRouter
    
    struct Dependencies {
        let model: PickModel
        let router: PickRouter
    }

    init(dependencies: Dependencies) {
        self.model = dependencies.model
        self.router = dependencies.router
    }
}

private extension PickPresenter {

    private func setHandlers() {
        guard let view = view else {
            return
        }
        self.view?.onTouchHandler = { [weak self] model in
            self?.router.next(name: model)
        }
    }
    
    func presentPickText() {
        let modelData = self.model.getPickText()
        let presentData = PickPresentModel(presentPickLabelText: "\(modelData.pickLabelText)", presentCarLabelText: "\(modelData.carLabelText)")
        self.view?.setPickContent(model: presentData)
    }
}

extension PickPresenter: IPickPresenter {
    func loadView(controller: PickViewController, view: IPickView) {
        self.controller = controller
        self.view = view
        self.presentPickText()
        self.setHandlers()
//        self.router.next(name: "")
    }
}

