import UIKit

final class PickRouter
{
    private var controller: PickViewController?
    private var targertController: ShowViewController?

    func setRootController(controller: PickViewController) {
        self.controller = controller
    }

    func setTargetController(controller: ShowViewController) {
        self.targertController = controller
    }

    func next(name: String) {
        guard let targertController = self.targertController else {
            return
        }
        let parameters = ShowAssembly.Parameters(car: name)
        let targetController = ShowAssembly.makeModule(parameters: parameters)
        self.controller?.navigationController?.pushViewController(targertController, animated: true)
    }
}
