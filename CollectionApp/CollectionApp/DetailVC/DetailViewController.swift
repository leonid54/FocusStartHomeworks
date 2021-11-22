import UIKit
import SnapKit

final class DetailViewController: UIViewController {

    var cityName = UILabel()
    var cityImageView = UIImageView()
    var currentPhoto = UIImage()
    var cityInfo = "No info"
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
        moreInfoVC.infoLabel.text = self.cityInfo
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
        }
        
        self.cityName.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(Metrics.defaultLeftCityNameConstraint)
            make.right.equalToSuperview().offset(Metrics.defaultRightCityNameConstraint)
            make.top.equalTo(self.cityImageView.snp.bottom).offset(Metrics.defaultTopCityNameConstraint)
        }
    }
}
