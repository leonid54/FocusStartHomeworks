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
        self.cityImageView.contentMode = .scaleAspectFit
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
            make.edges.equalToSuperview()
        }

        self.cityNameLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(self.cityImageView.snp.bottom).offset(-10)
            make.height.equalTo(20)
        }
    }

}
