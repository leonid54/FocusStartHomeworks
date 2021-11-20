import UIKit
import SnapKit

final class MoreInfoViewController: UIViewController {
    
    var infoLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
    }
    
    private func configure() {
        self.addSubviews()
        self.setConstraint()
        self.setConfig()
    }

    private func addSubviews() {
        self.view.addSubview(self.infoLabel)
    }

    private func setConfig() {
        self.view.backgroundColor = Metrics.defaultColorView
    }

    private func setConstraint() {
        self.infoLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview()
        }
    }
}
