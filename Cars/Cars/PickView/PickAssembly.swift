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

        router.setRootController(controller: controller)

        return controller
    }
}
