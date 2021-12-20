import UIKit

final class NetworkTableViewCell: UITableViewCell {
    private let networkImage = UIImageView()
    
    func setImageForCell(data: Data) {
        self.networkImage.image = UIImage(data: data)
    }

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
        self.networkImage.contentMode = .scaleAspectFill
        self.networkImage.clipsToBounds = false
    }

    private func setConstraint() {
        self.networkImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(self.networkImage.snp.width).dividedBy(2)
        }
    }
}
