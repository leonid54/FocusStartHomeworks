import UIKit

final class PickRouter {
    private var controller: PickViewController?
    private var targertController: ShowViewController?

    func setRootController(controller: PickViewController) {
        self.controller = controller
    }

    func setTargetController(controller: ShowViewController) {
        self.targertController = controller
    }

    func next(name: String) {
        let parameters = ShowAssembly.Parameters(car: name)
        self.setTargetController(controller: ShowAssembly.makeModule(parameters: parameters) as! ShowViewController)
        guard let targertController = self.targertController else {
            return
        }
        self.controller?.navigationController?.pushViewController(targertController, animated: true)
    }
}
