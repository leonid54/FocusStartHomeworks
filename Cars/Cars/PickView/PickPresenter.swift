import UIKit

final class PickPresenter {
    private let model = PickModel()
    private weak var controller: PickViewController?
    private weak var view: PickView?
    
    func loadView(controller: PickViewController, view: PickView) {
        self.controller = controller
        self.view = view
        self.view?.backgroundColor = .white
        self.presentPickText()
    }
    
    func presentPickText() {
        let modelData = self.model.getPickText()
        let presentData = PickPresentModel(presentPickLabelText: "\(modelData.pickLabelText)", presentCarLabelText: "\(modelData.carLabelText)")
        self.view?.setPickContent(model: presentData)
    }
}
