import UIKit

final class EmployeesViewCell: UITableViewCell {
    let nameLabel = UILabel()
    let ageLabel = UILabel()
    let expLabel = UILabel()
    
    func configure() {
        self.addSubviews()
        self.setConstraint()
        self.setConfig()
    }
}

private extension EmployeesViewCell {
    
    private func addSubviews() {
        self.addSubview(self.nameLabel)
        self.addSubview(self.ageLabel)
        self.addSubview(self.expLabel)
    }

    private func setConfig() {
    }

    private func setConstraint() {
        self.nameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Metrics.defaultTopConstraint)
            make.left.right.equalToSuperview().offset(Metrics.defaultLeftRightConstraint)
        }
        
        self.ageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(Metrics.defaultTopConstraint)
            make.left.right.equalToSuperview().offset(Metrics.defaultLeftRightConstraint)
        }
        
        self.expLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.ageLabel.snp.bottom).offset(Metrics.defaultTopConstraint)
            make.left.right.equalToSuperview().offset(Metrics.defaultLeftRightConstraint)
            make.bottom.equalToSuperview()
        }
    }
}
