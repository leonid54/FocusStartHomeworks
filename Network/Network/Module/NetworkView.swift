import UIKit
import SnapKit

protocol INetworkView: AnyObject {
    func setLabel(text: String)
    func setImage(data: Data)
    func setupInitialState()
    var onTouchedHandler: ((String) -> Void)? { get set }
    
}

final class NetworkView: UIViewController {
    private lazy var presenter: INetworkPresenter = {
        return NetworkPresenter(view: self)
    }()
    private let searchTextField = UITextField()
    private let searchButton = UIButton()
    private let imageView = UIImageView()
    private let tableView = NetworkTableView()
    var onTouchedHandler: ((String) -> Void)?
    var data: [Data] = [Data]() {
        didSet {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.configure()
        self.presenter.onViewReady()
        self.tableView.counter = { [weak self] in
            return self?.data.count ?? 0
        }
        self.tableView.dataForIndex = { [weak self] index in
            return self?.data[index]
        }
    }

}

private extension NetworkView {
    
    private func configure() {
        self.setConfig()
        self.addSubviews()
        self.setConstraint()
    }
    
    private func addSubviews() {
        self.view.addSubview(self.searchTextField)
        self.view.addSubview(self.searchButton)
        
        self.view.addSubview(self.imageView)
        
        self.view.addSubview(self.tableView)
    }
    private func setConfig() {
        self.searchButton.setTitle("PRESS TO GET IMAGE", for: .normal)
        self.searchButton.setTitleColor(.black, for: .normal)
        self.searchButton.addTarget(self, action: #selector(self.getImage), for: .touchDown)
    }

    private func setConstraint() {
        self.searchTextField.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(100)
            make.left.right.equalToSuperview().inset(10)
        }
        
        self.searchButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.searchTextField.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(30)
        }
        
        self.imageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.searchButton.snp.bottom).offset(30)
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
        }
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.imageView.snp.bottom).offset(30)
            make.left.right.equalToSuperview()
            make.height.equalTo(1000)
        }
    }
    
    @objc private func getImage() {
        guard let text = self.searchTextField.text else { return  }
        self.onTouchedHandler?(text)
       }
}

extension NetworkView: INetworkView {
    func setImage(data: Data) {
        self.data.append(data)
    }
    
    func setupInitialState() {
        self.navigationController?.title = "Network test"
    }
    
    func setLabel(text: String) {
        self.searchButton.setTitle(text, for: .normal)
    }

}
