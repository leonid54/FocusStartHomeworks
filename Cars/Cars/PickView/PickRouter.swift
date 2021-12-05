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

    func next() {
        guard let targertController = self.targertController else {
            return
        }
        self.controller?.navigationController?.pushViewController(targertController, animated: true)
    }
}
