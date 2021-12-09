import UIKit

protocol IPickTableViewCell {
    func set(model: Car)
}

final class PickTableViewCell: UITableViewCell {
    private let nameLabel = UILabel()
    private let selectLabel = UILabel()
    private let greenCircle = UIImageView()
    
    func configure() {
        self.addSubviews()
        self.setConstraint()
        self.setConfig()
    }
}

private extension PickTableViewCell {
    
    private func addSubviews() {
        self.addSubview(self.nameLabel)
        self.addSubview(self.selectLabel)
        self.addSubview(self.greenCircle)
    }

    private func setConfig() {
        self.nameLabel.textColor = .black
        self.selectLabel.text = "Select"
        self.greenCircle.backgroundColor = UIColor(red: 0.366, green: 0.692, blue: 0.457, alpha: 1)
        self.greenCircle.layer.cornerRadius = 8
    }

    private func setConstraint() {
        self.nameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(48)
            make.right.equalToSuperview().offset(-16)
        }
        
        self.selectLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-16)
        }

        self.greenCircle.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(16)
            make.width.equalTo(16)
        }
    }
}

extension PickTableViewCell: IPickTableViewCell {
    func set(model: Car) {
        self.nameLabel.text = model.name
    }
}
