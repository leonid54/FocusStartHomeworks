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
            make.top.equalToSuperview().offset(5)
            make.left.right.equalToSuperview().offset(10)
        }
        
        self.ageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(5)
            make.left.right.equalToSuperview().offset(10)
        }
        
        self.expLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.ageLabel.snp.bottom).offset(5)
            make.left.right.equalToSuperview().offset(10)
            make.bottom.equalToSuperview()
        }
    }
}
