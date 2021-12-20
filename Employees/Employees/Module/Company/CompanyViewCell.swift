import UIKit

final class CompanyViewCell: UITableViewCell {
    let nameLabel = UILabel()
    
    func configure() {
        self.addSubviews()
        self.setConstraint()
    }
}

private extension CompanyViewCell {
    
    private func addSubviews() {
        self.addSubview(self.nameLabel)
    }

    private func setConstraint() {
        self.nameLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
