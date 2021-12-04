import UIKit
import SnapKit

final class PickView: UIView {
    private let contentView = UIView()
    private let scrollView = UIScrollView()
    private let pickLabel = UILabel()
    private let carLabel = UILabel()
    private let tableView = PickTableView()
    
    func setPickContent(model: PickPresentModel) {
        self.pickLabel.text = model.presentPickLabelText
        self.carLabel.text = model.presentCarLabelText
    }
    
    func configurePickView() {
        self.addSubviews()
        self.setConstraint()
        self.setConfig()
    }
    
    private func addSubviews() {
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        
        self.contentView.addSubview(self.pickLabel)
        self.contentView.addSubview(self.carLabel)
        self.contentView.addSubview(self.tableView)
    }
    
    private func setConfig() {
        self.pickLabel.textColor = .black
        self.pickLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        
        self.carLabel.textColor = .black
        self.carLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
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
        
        self.pickLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView).offset(60)
            make.centerX.equalTo(self.contentView)
        }
        
        self.carLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.pickLabel.snp.bottom).offset(43)
            make.left.equalTo(self.contentView).offset(18)
            make.right.equalTo(self.contentView).offset(-14)
        }
        
        self.tableView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.contentView)
            make.top.equalTo(self.carLabel.snp.bottom).offset(22)
        }
    }
}
   
