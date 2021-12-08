import UIKit

import SnapKit
protocol IShowView {
    func setShowContent(model: ShowPresentModel)
    func update(price: String)
    func setDefaultCar(defaultCar: String)
    func setCurrentCar(currentCar: String)
    func showActivityIndicator()
    var onTouchedCarButtonHandler: ((String) -> Void)? { get set }
    var onTouchedGetPriceHandler: ((String) -> Void)? { get set }
}

final class ShowView: UIView {
    private let contentView = UIView()
    private let scrollView = UIScrollView()
    private let image = UIImage()
    private let imageView = UIImageView()
    private let priceTopLabel = UILabel()
    private let priceBottomLabel = UILabel()
    private let typeCarLabel = UILabel()
    private let sedanButton = UIButton()
    private let universalButton = UIButton()
    private let cabrioletButton = UIButton()
    private let furgonButton = UIButton()
    private let calculatePriceButton = UIButton()
    var spinner = UIActivityIndicatorView(style: .whiteLarge)
    var loadingView: UIView = UIView()
    private var currentButton: String?
    var onTouchedCarButtonHandler: ((String) -> Void)?
    var onTouchedGetPriceHandler: ((String) -> Void)?
    
    //    private let sLineView = UIView()
    //    private let uLineView = UIView()
    //    private let cLineView = UIView()
    //    private let fLineView = UIView()
    
    func hideActivityIndicator() {
        self.spinner.stopAnimating()
        self.loadingView.removeFromSuperview()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    private func configureView() {
        self.addSubviews()
        self.setConfig()

        self.setConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConfig() {
        self.loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
        self.loadingView.backgroundColor = UIColor.black
        self.loadingView.alpha = 0.7
        self.loadingView.clipsToBounds = true
        self.loadingView.layer.cornerRadius = 10
        
        self.spinner = UIActivityIndicatorView(style: .whiteLarge)
        self.spinner.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
        self.spinner.center = CGPoint(x:self.loadingView.bounds.size.width / 2, y:self.loadingView.bounds.size.height / 2)
        self.backgroundColor = .white
        
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.clipsToBounds = true
        
        self.priceTopLabel.textColor = .black
        self.priceTopLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)

        self.priceBottomLabel.textColor = .black
        self.priceBottomLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        self.typeCarLabel.textColor = .black
        self.typeCarLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        
        self.sedanButton.backgroundColor = .white
        self.sedanButton.contentHorizontalAlignment = .left
        self.sedanButton.setTitleColor(UIColor.black, for: .normal)
        self.sedanButton.addTarget(self, action: #selector(self.sedanTouchedDown), for: .touchDown)
        
        self.universalButton.backgroundColor = .white
        self.universalButton.contentHorizontalAlignment = .left
        self.universalButton.setTitleColor(UIColor.black, for: .normal)
        self.universalButton.addTarget(self, action: #selector(self.univTouchedDown), for: .touchDown)

        
        self.cabrioletButton.backgroundColor = .white
        self.cabrioletButton.contentHorizontalAlignment = .left
        self.cabrioletButton.setTitleColor(UIColor.black, for: .normal)
        self.cabrioletButton.addTarget(self, action: #selector(self.cabrTouchedDown), for: .touchDown)
        
        self.furgonButton.backgroundColor = .white
        self.furgonButton.contentHorizontalAlignment = .left
        self.furgonButton.setTitleColor(UIColor.black, for: .normal)
        self.furgonButton.addTarget(self, action: #selector(self.furgonTouchedDown), for: .touchDown)
        
        self.calculatePriceButton.backgroundColor = .green
        self.calculatePriceButton.layer.cornerRadius = 10
        self.calculatePriceButton.setTitleColor(UIColor.white, for: .normal)
        self.calculatePriceButton.addTarget(self, action: #selector(self.getPriceTouchedDown), for: .touchDown)
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
            make.height.equalTo(self.scrollView).offset(50)
        }
        
        self.imageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView).offset(48)
            make.right.equalTo(self.contentView).offset(-18)
            make.left.equalTo(self.contentView).offset(17)
            make.height.equalTo(self.imageView.snp.width).dividedBy(2)
        }
        
        self.priceTopLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.imageView.snp.bottom).offset(23)
            make.left.equalTo(self.contentView).offset(16)
            make.right.equalTo(self.contentView).offset(-16)
        }
        
        self.priceBottomLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.priceTopLabel.snp.bottom).offset(8)
            make.left.equalTo(self.contentView).offset(16)
            make.right.equalTo(self.contentView).offset(-16)
        }
        
        self.typeCarLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.priceBottomLabel.snp.bottom).offset(23)
            make.left.equalTo(self.contentView).offset(16)
            make.right.equalTo(self.contentView).offset(-16)
        }
        
        self.sedanButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.typeCarLabel.snp.bottom).offset(18)
            make.left.equalTo(self.contentView).offset(16)
            make.right.equalTo(self.contentView).offset(-16)
            make.height.equalTo(19)
            make.width.equalTo(50)
        }
        
        self.universalButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.sedanButton.snp.bottom).offset(32)
            make.left.equalTo(self.contentView).offset(16)
            make.right.equalTo(self.contentView).offset(-16)
            make.height.equalTo(19)
            make.width.equalTo(50)
        }
        
        self.cabrioletButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.universalButton.snp.bottom).offset(32)
            make.left.equalTo(self.contentView).offset(16)
            make.right.equalTo(self.contentView).offset(-16)
            make.height.equalTo(19)
            make.width.equalTo(50)
        }
        
        self.furgonButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.cabrioletButton.snp.bottom).offset(32)
            make.left.equalTo(self.contentView).offset(16)
            make.right.equalTo(self.contentView).offset(-16)
            make.height.equalTo(19)
            make.width.equalTo(50)
        }
        
        self.calculatePriceButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.furgonButton.snp.bottom).offset(140)
            make.left.equalTo(self.contentView).offset(16)
            make.right.equalTo(self.contentView).offset(-16)
            make.height.equalTo(51)
            make.width.equalTo(343)
        }
        
        self.loadingView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
        }
        
//        self.sLineView.snp.makeConstraints { (make) in
//            make.top.equalTo(self.sedanButton.snp.bottom).offset(15)
//            make.left.right.equalToSuperview().offset(10)
//            make.bottom.equalTo(self.universalButton.snp.top).offset(-17)
//        }
    }
    
}
   
private extension ShowView {
    
    private func addSubviews() {
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        
        self.contentView.addSubview(self.imageView)
        self.contentView.addSubview(self.priceTopLabel)
        self.contentView.addSubview(self.priceBottomLabel)
        self.contentView.addSubview(self.typeCarLabel)
        self.contentView.addSubview(self.sedanButton)
        self.contentView.addSubview(self.universalButton)
        self.contentView.addSubview(self.cabrioletButton)
        self.contentView.addSubview(self.furgonButton)
        self.contentView.addSubview(self.calculatePriceButton)
        self.contentView.addSubview(self.loadingView)
        self.loadingView.addSubview(self.spinner)
    }
    
    @objc private func sedanTouchedDown() {
        self.currentButton = "sedan"
        guard let currentType = self.currentButton else {
            return
        }
        self.onTouchedCarButtonHandler?(currentType)
    }
    
    @objc private func univTouchedDown() {
        self.currentButton = "univ"
        guard let currentType = self.currentButton else {
            return
        }
        self.onTouchedCarButtonHandler?(currentType)
    }
    
    @objc private func cabrTouchedDown() {
        self.currentButton = "cabr"
        guard let currentType = self.currentButton else {
            return
        }
        self.onTouchedCarButtonHandler?(currentType)
    }
    
    @objc private func furgonTouchedDown() {
        self.currentButton = "furgon"
        guard let currentType = self.currentButton else {
            return
        }
        self.onTouchedCarButtonHandler?(currentType)
    }
    
    @objc private func getPriceTouchedDown() {
        guard let currentButton = self.currentButton else {
            return
        }
        self.onTouchedGetPriceHandler?(currentButton)
    }
}

extension ShowView: IShowView {
    
    func setShowContent(model: ShowPresentModel) {
        self.priceTopLabel.text = model.priceTopLabelText
        self.priceBottomLabel.text = model.priceBottomLabelText
        self.typeCarLabel.text = model.typeCarLabelText
        self.sedanButton.setTitle(model.sedanButtonText, for: .normal)
        self.universalButton.setTitle(model.universalButtonText, for: .normal)
        self.cabrioletButton.setTitle(model.cabrioletButtonText, for: .normal)
        self.furgonButton.setTitle(model.furgonButtonText, for: .normal)
        self.calculatePriceButton.setTitle(model.calculatePriceButtonText, for: .normal)
    }
    
    func update(price: String) {
        self.priceBottomLabel.text = price
    }
    
    func showActivityIndicator() {
        self.spinner.startAnimating()
    }
    
    func setDefaultCar(defaultCar: String) {
        self.imageView.image = UIImage(named: defaultCar)
    }
    
    func setCurrentCar(currentCar: String) {
        self.imageView.image = UIImage(named: currentCar)
    }
}
