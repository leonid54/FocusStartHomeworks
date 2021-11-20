import UIKit
import SnapKit

final class DetailViewController: UIViewController {

    var cityName = UILabel()
    var cityImageView = UIImageView()
    var currentPhoto = UIImage()
    private var cityInfoButton = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
    }

    private func configure() {
        self.addSubviews()
        self.setConstraint()
        self.setConfig()
    }
    
    @objc func getInfo() {
        let moreInfoVC = MoreInfoViewController()
        self.present(moreInfoVC, animated: true, completion: nil)
    }

    private func addSubviews() {
        self.view.addSubview(self.cityImageView)
        self.view.addSubview(self.cityName)
    }

    private func setConfig() {
        self.view.backgroundColor = Metrics.defaultColorView
        self.cityInfoButton.title = "Info"
        self.cityInfoButton.style = Metrics.defaultBarButtonItemStyle
        self.cityInfoButton.target = self
        self.cityInfoButton.action = #selector(getInfo)
        self.navigationItem.rightBarButtonItem = cityInfoButton
    }

    private func setConstraint() {
        self.cityImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
        self.cityName.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.top.equalTo(self.cityImageView.snp.bottom).offset(10)
        }
    }
}
