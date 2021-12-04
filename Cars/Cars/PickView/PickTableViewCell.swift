import UIKit

protocol IPickTableViewCell {
    func set(model: Car)
}

final class PickTableViewCell: UITableViewCell {
    private let nameLabel = UILabel()

    internal func configure() {
        self.addSubviews()
        self.setConstraint()
        self.setConfig()
    }

    private func addSubviews() {
        self.addSubview(self.nameLabel)
    }

    private func setConfig() {
        self.nameLabel.textColor = .black
        self.nameLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold)
        self.nameLabel.lineBreakMode = .byWordWrapping
        self.nameLabel.numberOfLines = 0
    }

    private func setConstraint() {
        self.nameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(36)
        }
    }
}

extension PickTableViewCell: IPickTableViewCell {
    func set(model: Car) {
        self.nameLabel.text = model.name
    }
}
