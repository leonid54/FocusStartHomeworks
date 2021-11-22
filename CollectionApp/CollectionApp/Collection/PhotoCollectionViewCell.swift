import UIKit
import SnapKit

final class PhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCollectonViewCell"

    private let cityImageView = UIImageView()
    private let cityNameLabel = UILabel()
    
    var image: City? {
        didSet {
            guard let image = image else { return }
            self.cityImageView.image = UIImage(named: image.name)
            self.cityNameLabel.text = image.name
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: Metrics.defaultWithDuration) {
                self.alpha = self.isHighlighted ? Metrics.defaultIsHighlightedTrue : Metrics.defaultIsHighlightedFalse
            }
        }
    }
    
    private func configure() {
        self.addSubviews()
        self.setConstraint()
        self.setConfig()
    }
    
    private func setConfig() {
        self.cityImageView.contentMode = .scaleAspectFill
        self.cityImageView.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        self.addSubview(self.cityImageView)
        self.addSubview(self.cityNameLabel)
    }
    
    private func setConstraint() {
        self.cityImageView.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(self.cityImageView.snp.width).dividedBy(Metrics.defaultDividedBy)
        }

        self.cityNameLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(self.cityImageView.snp.bottom).offset(Metrics.defaultTopCityNameLabelConstraint)
            make.height.equalTo(Metrics.defaultHeightCityNameLabelConstraint)
        }
    }

}
