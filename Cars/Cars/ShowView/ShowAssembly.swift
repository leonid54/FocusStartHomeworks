import UIKit

final class ShowAssembly {
    
    struct Parameters {
        var car: String
    }

    static func makeModule(parameters: Parameters) -> UIViewController {
        let model = ShowModel()
        let router = ShowRouter()
        let presenter = ShowPresenter(router: router, car: parameters.car)
        let controller = ShowViewController(presenter: presenter)
        return controller
    }
}
