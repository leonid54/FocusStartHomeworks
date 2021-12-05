import UIKit

final class ShowAssembly
{
    static func makeModule() -> UIViewController {
        let model = ShowModel()
        let router = ShowRouter()
        let presenter = ShowPresenter(
            dependencies: .init(model: model, router: router)
        )
        let controller = ShowViewController(
            dependencies: .init(presenter: presenter)
        )
        return controller
    }
}
