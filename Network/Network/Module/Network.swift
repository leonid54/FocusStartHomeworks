import UIKit

protocol INetworkService {
}

final class NetworkService: INetworkService {
    private let session: URLSession

    init(configuration: URLSessionConfiguration? = nil) {
        if let configuration = configuration {
            self.session = URLSession(configuration: configuration)
        }
        else {
            self.session = URLSession(configuration: URLSessionConfiguration.default)
        }
    }
}
