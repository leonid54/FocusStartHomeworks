import UIKit

final class PickAssembly
{
    static func makeModule() -> UIViewController {
        let model = PickModel()
        let router = PickRouter()

        let presenter = PickPresenter(
            dependencies: .init(model: model, router: router)
        )
        let controller = PickViewController(
            dependencies: .init(presenter: presenter)
        )
        let targetController = ShowAssembly.makeModule()

        router.setRootController(controller: controller)
        router.setTargetController(controller: targetController as! ShowViewController)

        return controller
    }
}
