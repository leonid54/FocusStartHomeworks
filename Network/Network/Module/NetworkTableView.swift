import UIKit

final class NetworkTableView: UIView {
    private var networkTableView: UITableView = UITableView()
    var dataForIndex: ((Int) -> Data?)?
    var counter: (() -> Int)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadData() {
        self.networkTableView.reloadData()
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

extension NetworkTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.counter?() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = NetworkTableViewCell()
        cell.configure()
        
        guard let data = self.dataForIndex?(indexPath.row) else { return cell }
        cell.setImageForCell(data: data)
        return cell
    }
}
