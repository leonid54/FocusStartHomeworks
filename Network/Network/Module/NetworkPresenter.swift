import UIKit

protocol INetworkPresenter {
}

final class NetworkPresenter: INetworkPresenter {
    private weak var view: INetworkView?

    init(view: INetworkView) {
        self.view = view

    }
}

