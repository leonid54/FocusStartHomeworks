import UIKit

protocol INetworkTableView {
    var onTouchedHandler: ((String) -> Void)? { get set }
}

final class NetworkTableView: UIView, INetworkTableView {
    private var networkTableView: UITableView = UITableView()
    var onTouchedHandler: ((String) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension NetworkTableView {
    
    private func configure() {
        self.setConfig()
        self.addDelegate()
        self.addSubviews()
        self.setConstraint()
    }
    
    private func addSubviews() {
        self.addSubview(self.networkTableView)
    }

    private func addDelegate() {
        self.networkTableView.dataSource = self
        self.networkTableView.delegate = self
    }

    private func setConfig() {
        self.networkTableView.showsVerticalScrollIndicator = false
    }

    private func setConstraint() {
        self.networkTableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension NetworkTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

extension NetworkTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = NetworkTableViewCell()
        cell.configure()

        return cell
    }
}
