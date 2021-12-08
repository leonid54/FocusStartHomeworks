import UIKit
import SnapKit

final class HobbieViewController: UIViewController {

    let viewModel = HobbieViewModel()
    private let contentView = UIView()
    private let scrollView = UIScrollView()
    private let sportLabel = UILabel()
    private let descSportLabel = UILabel()
    private let artLabel = UILabel()
    private let descArtLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
        
        self.viewModel.data.setNotify { [weak self] text in
            self?.sportLabel.text = text.sportText
            self?.descSportLabel.text = text.descSportText
            self?.artLabel.text = text.artText
            self?.descArtLabel.text = text.descArtText
        }
    }

    private func configure() {
        self.addSubviews()
        self.setConstraint()
        self.setConfig()
    }

    private func addSubviews() {
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)

        self.contentView.addSubview(self.sportLabel)
        self.contentView.addSubview(self.descSportLabel)
        self.contentView.addSubview(self.artLabel)
        self.contentView.addSubview(self.descArtLabel)
    }

    private func setConfig() {
        self.view.backgroundColor = .white

        self.sportLabel.textColor = .black
        self.sportLabel.font = UIFont.systemFont(ofSize: Metrics.headingLabelSize, weight: Metrics.defaultLabelFontWeight)
        self.sportLabel.adjustsFontSizeToFitWidth = true
        self.sportLabel.numberOfLines = Metrics.defaultNumberOfLines
        
        self.descSportLabel.adjustsFontSizeToFitWidth = true
        self.descSportLabel.numberOfLines = Metrics.defaultNumberOfLines
        
        self.artLabel.textColor = .black
        self.artLabel.font = UIFont.systemFont(ofSize: Metrics.headingLabelSize, weight: Metrics.defaultLabelFontWeight)
        self.artLabel.adjustsFontSizeToFitWidth = true
        self.artLabel.numberOfLines = Metrics.defaultNumberOfLines
        
        self.descArtLabel.adjustsFontSizeToFitWidth = true
        self.descArtLabel.numberOfLines = Metrics.defaultNumberOfLines
    }

    private func setConstraint() {
        self.scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        self.contentView.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self.scrollView)
            make.left.right.equalTo(self.scrollView)
            make.bottom.equalTo(self.scrollView)
            make.width.equalTo(self.scrollView)
            make.height.equalTo(self.scrollView)
        }

        self.sportLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView).offset(10)
            make.left.equalTo(self.contentView).offset(11)
            make.right.equalTo(self.contentView).offset(-11)
        }
        
        self.descSportLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.sportLabel.snp.bottom).offset(10)
            make.left.equalTo(self.contentView).offset(11)
            make.right.equalTo(self.contentView).offset(-11)
        }

        self.artLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.descSportLabel.snp.bottom).offset(10)
            make.left.equalTo(self.contentView).offset(11)
            make.right.equalTo(self.contentView).offset(-11)
        }
        
        self.descArtLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.artLabel.snp.bottom).offset(10)
            make.left.equalTo(self.contentView).offset(11)
            make.right.equalTo(self.contentView).offset(-11)
        }
    }
}
