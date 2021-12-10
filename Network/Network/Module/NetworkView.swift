import UIKit
import SnapKit

protocol INetworkView: AnyObject {
}

final class NetworkView: UIViewController, INetworkView {
    private let searchTextField = UITextField()
    private let searchButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

