import UIKit
import SnapKit

final class MoreInfoViewController: UIViewController {
    
    var infoLabel = UILabel()
    private var deleteButton = UIBarButtonItem()
    private let navBar = UINavigationBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
    }
    
    @objc func backOn() {
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    private func configure() {
        self.addSubviews()
        self.setConstraint()
        self.setConfig()
    }

    private func addSubviews() {
        self.view.addSubview(self.infoLabel)
        self.view.addSubview(self.navBar)
    }

    private func setConfig() {
        self.navBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44)
        let navItem = UINavigationItem(title: "Description")
        self.view.backgroundColor = Metrics.defaultColorView
        self.deleteButton.title = "Back"
        self.deleteButton.style = Metrics.defaultBarButtonItemStyle
        self.deleteButton.target = self
        self.deleteButton.action = #selector(backOn)
        navItem.leftBarButtonItem = deleteButton
        self.navBar.setItems([navItem], animated: true)
    }

    private func setConstraint() {
        self.infoLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview()
        }
    }
}
