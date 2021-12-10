import UIKit

final class NetworkTableViewCell: UITableViewCell {
    private let networkImage = UIImageView()
    
    func configure() {
        self.addSubviews()
        self.setConstraint()
        self.setConfig()
    }
}

private extension NetworkTableViewCell {
    
    private func addSubviews() {
        self.addSubview(self.networkImage)
    }

    private func setConfig() {
    
    }

    private func setConstraint() {
    }
}
