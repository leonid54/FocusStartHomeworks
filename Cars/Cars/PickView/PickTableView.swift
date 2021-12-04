import UIKit

final class PickTableView: UIView {
    private var PickTableView: UITableView = UITableView()
    private var contentModel = Car.cars

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//
//    internal func setContent(model: [VacancyInfo]) {
//        self.contentModel = model
//        self.hotVacanciesTableView.reloadData()
//    }

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

extension PickTableView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PickTableViewCell()

//        if let vacancy = self.contentModel?[indexPath.row] {
//            cell.set(vacancy: vacancy)
//        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 77
    }
}
