import UIKit

protocol INetworkPresenter {
    func onViewReady()
}

final class NetworkPresenter: INetworkPresenter {
    private weak var view: INetworkView?
    private var networkService = NetworkService()

    init(view: INetworkView) {
        self.view = view
        self.view?.onTouchedHandler = { [weak self] model in
            self?.loadData(url: model)
        }
    }
    
    func onViewReady() {
        self.view?.setupInitialState()
    }
    
    func loadData(url: String) {
        self.view?.setLabel(text: "Image loading")
        self.networkService.loadData(url: url) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.view?.setImage(data: data)
                    self.view?.setLabel(text: "Загрузка закончена")
                }
            case .failure(let error):
                print("[NETWORK] error is: \(error)")
                DispatchQueue.main.async {
                    self.view?.setLabel(text: "Загрузка закончена с ошибкой \(error.localizedDescription)")
                }
            }
        }
    }
}

