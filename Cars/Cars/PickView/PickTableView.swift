import UIKit
protocol IPickTableView {
    var onTouchedHandler: ((String) -> Void)? { get set }
}

final class PickTableView: UIView, IPickTableView {
    private var PickTableView: UITableView = UITableView()
    private var contentModel = Car.cars
    var onTouchedHandler: ((String) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        self.setConfig()
        self.addDelegate()
        self.addSubviews()
        self.setConstraint()
    }

    private func addSubviews() {
        self.addSubview(self.PickTableView)
    }

    private func addDelegate() {
        self.PickTableView.dataSource = self
        self.PickTableView.delegate = self
    }

    private func setConfig() {
        self.PickTableView.showsVerticalScrollIndicator = false
    }

    private func setConstraint() {
        self.PickTableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension PickTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let car = self.contentModel[indexPath.row]
        self.onTouchedHandler?(car.name)
    }
}

extension PickTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PickTableViewCell()
        cell.configure()
        let car = self.contentModel[indexPath.row]
        cell.set(model: car)
        return cell
    }
}
