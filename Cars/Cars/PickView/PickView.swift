import UIKit
import SnapKit

protocol IPickView {
    func setPickContent(model: PickPresentModel)
    var onTouchHandler: ((String) -> Void)? { get set }
}

final class PickView: UIView {
    private let contentView = UIView()
    private let scrollView = UIScrollView()
    private let pickLabel = UILabel()
    private let carLabel = UILabel()
    private let tableView = PickTableView()
    var onTouchHandler: ((String) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
        self.tableView.onTouchedHandler = { [weak self] model in
            self?.onTouchHandler?(model)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
   
private extension PickView {
    
    private func configureView() {
        self.addSubviews()
        self.setConstraint()
        self.setConfig()
    }
    
    private func setConfig() {
        self.backgroundColor = Metrics.defaultBackColorView
        self.pickLabel.textColor = Metrics.defaultBlackColor
        self.pickLabel.font = Metrics.pickViewPickLabelFont
        
        self.carLabel.textColor = Metrics.defaultBlackColor
        self.carLabel.font = Metrics.pickViewCarLabelFont
    }
    
    private func setConstraint() {
        self.scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.contentView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        self.pickLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Metrics.pickViewPickLabelTopConstraint)
            make.centerX.equalToSuperview()
        }
        
        self.carLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.pickLabel.snp.bottom).offset(Metrics.pickViewCarLabelTopConstraint)
            make.left.equalToSuperview().offset(Metrics.pickViewCarLabelLeftConstraint)
            make.right.equalToSuperview().offset(Metrics.pickViewCarLabelRightConstraint)
        }
        
        self.tableView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.carLabel.snp.bottom).offset(Metrics.pickViewTableViewTopConstraint)
            make.height.equalTo(Metrics.pickViewTableViewHeightConstraint)
        }
    }
    
    private func addSubviews() {
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        
        self.contentView.addSubview(self.pickLabel)
        self.contentView.addSubview(self.carLabel)
        self.contentView.addSubview(self.tableView)
    }
}

extension PickView: IPickView {

    func setPickContent(model: PickPresentModel) {
        self.pickLabel.text = model.presentPickLabelText
        self.carLabel.text = model.presentCarLabelText
    }
}
