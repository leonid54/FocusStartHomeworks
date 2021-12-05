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

private extension PickPresenter
{
    private func onTouched() {
        guard let view = view else {
            return
        }
        self.view?.touched()
        self.router.next()
    }

    private func setHandlers() {
    }
    
    func presentPickText() {
        let modelData = self.model.getPickText()
        let presentData = PickPresentModel(presentPickLabelText: "\(modelData.pickLabelText)", presentCarLabelText: "\(modelData.carLabelText)")
        self.view?.setPickContent(model: presentData)
    }
}

extension PickPresenter: IPickPresenter
{
    func loadView(controller: PickViewController, view: IPickView) {
        self.controller = controller
        self.view = view
        self.presentPickText()
        self.setHandlers()
    }
}

