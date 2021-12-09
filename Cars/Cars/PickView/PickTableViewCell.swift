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
        self.nameLabel.textColor = Metrics.defaultBlackColor
        self.selectLabel.text = "Select"
        self.greenCircle.backgroundColor = Metrics.pickViewCellGreenCircleColor
        self.greenCircle.layer.cornerRadius = Metrics.pickViewCellGreenCircleRadius
    }

    private func setConstraint() {
        self.nameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Metrics.pickViewCellNameLabelTop)
            make.left.equalToSuperview().offset(Metrics.pickViewCellNameLabelLeft)
            make.right.equalToSuperview().offset(Metrics.pickViewCellNameLabelRight)
        }
        
        self.selectLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Metrics.pickViewCellSelectLabelTop)
            make.right.equalToSuperview().offset(Metrics.pickViewCellSelectLabelRight)
        }

        self.greenCircle.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(Metrics.pickViewCellGreenLabelLeft)
            make.top.equalToSuperview().offset(Metrics.pickViewCellGreenLabelTop)
            make.height.equalTo(Metrics.pickViewCellGreenLabelHeight)
            make.width.equalTo(Metrics.pickViewCellGreenLabelWidth)
        }
    }
}

extension PickTableViewCell: IPickTableViewCell {
    func set(model: Car) {
        self.nameLabel.text = model.name
    }
}
