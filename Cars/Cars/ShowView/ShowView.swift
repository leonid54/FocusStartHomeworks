import UIKit

import SnapKit
protocol IShowView {
    func setShowContent(model: ShowPresentModel)
    func update(price: String)
    func setDefaultCar(defaultCar: String)
    func setCurrentCar(currentCar: String)
    func showActivityIndicator()
    func hideActivityIndicator()
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
    private let sLineView = UIView()
    private let uLineView = UIView()
    private let cLineView = UIView()
    private let fLineView = UIView()
    private let activityView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    private var currentButton: String?

    var onTouchedCarButtonHandler: ((String) -> Void)?
    var onTouchedGetPriceHandler: ((String) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
   
private extension ShowView {
    
    private func configureView() {
        self.addSubviews()
        self.setConfig()
        self.setConstraint()
    }
    
    private func setConfig() {
        self.backgroundColor = Colors.defaultBackColorView
        self.activityView.center = self.center

        self.imageView.contentMode = .scaleAspectFill
        self.imageView.clipsToBounds = true
        
        self.priceTopLabel.textColor = Colors.defaultBlackColor
        self.priceTopLabel.font = Fonts.showViewPriceTopLabelFont

        self.priceBottomLabel.textColor = Colors.defaultBlackColor
        self.priceBottomLabel.font = Fonts.showViewPriceBottomLabelFont
        
        self.typeCarLabel.textColor = Colors.defaultBlackColor
        self.typeCarLabel.font = Fonts.showViewCarLabelFont
        
        self.sedanButton.backgroundColor = Colors.defaultBackColorView
        self.sedanButton.contentHorizontalAlignment = .left
        self.sedanButton.setTitleColor(UIColor.black, for: .normal)
        self.sedanButton.addTarget(self, action: #selector(self.sedanTouchedDown), for: .touchDown)
        
        self.universalButton.backgroundColor = Colors.defaultBackColorView
        self.universalButton.contentHorizontalAlignment = .left
        self.universalButton.setTitleColor(Colors.defaultBlackColor, for: .normal)
        self.universalButton.addTarget(self, action: #selector(self.univTouchedDown), for: .touchDown)

        
        self.cabrioletButton.backgroundColor = Colors.defaultBackColorView
        self.cabrioletButton.contentHorizontalAlignment = .left
        self.cabrioletButton.setTitleColor(Colors.defaultBlackColor, for: .normal)
        self.cabrioletButton.addTarget(self, action: #selector(self.cabrTouchedDown), for: .touchDown)
        
        self.furgonButton.backgroundColor = Colors.defaultBackColorView
        self.furgonButton.contentHorizontalAlignment = .left
        self.furgonButton.setTitleColor(Colors.defaultBlackColor, for: .normal)
        self.furgonButton.addTarget(self, action: #selector(self.furgonTouchedDown), for: .touchDown)
        
        self.calculatePriceButton.backgroundColor = Colors.showViewCalPriceButtonColor
        self.calculatePriceButton.layer.cornerRadius = Metrics.showViewCalPriceButtonRadius
        self.calculatePriceButton.setTitleColor(Colors.defaultBackColorView, for: .normal)
        self.calculatePriceButton.addTarget(self, action: #selector(self.getPriceTouchedDown), for: .touchDown)
        
        self.sLineView.backgroundColor = Colors.showViewLineViewColor
        self.uLineView.backgroundColor = Colors.showViewLineViewColor
        self.cLineView.backgroundColor = Colors.showViewLineViewColor
        self.fLineView.backgroundColor = Colors.showViewLineViewColor
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
            make.height.equalToSuperview().offset(Metrics.showViewContentViewHeight)
        }
        
        self.imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Metrics.showViewLImageViewTop)
            make.right.equalToSuperview().offset(Metrics.showViewImageViewRight)
            make.left.equalToSuperview().offset(Metrics.showViewImageViewLeft)
            make.height.equalTo(self.imageView.snp.width).dividedBy(Metrics.showViewImageViewRDivided)
        }
        
        self.priceTopLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.imageView.snp.bottom).offset(Metrics.showViewPriceTopLabelTop)
            make.left.equalToSuperview().offset(Metrics.showViewPriceTopLabelLeft)
            make.right.equalToSuperview().offset(Metrics.showViewPriceTopLabelRight)
        }
        
        self.priceBottomLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.priceTopLabel.snp.bottom).offset(Metrics.showViewPriceBottomLabelTop)
            make.left.equalToSuperview().offset(Metrics.showViewPriceTopLabelLeft)
            make.right.equalToSuperview().offset(Metrics.showViewPriceTopLabelRight)
        }
        
        self.typeCarLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.priceBottomLabel.snp.bottom).offset(Metrics.showViewTypeCarTop)
            make.left.equalToSuperview().offset(Metrics.showViewPriceTopLabelLeft)
            make.right.equalToSuperview().offset(Metrics.showViewPriceTopLabelRight)
        }
        
        self.sedanButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.typeCarLabel.snp.bottom).offset(Metrics.showViewSedanButtonTop)
            make.left.equalToSuperview().offset(Metrics.showViewPriceTopLabelLeft)
            make.right.equalToSuperview().offset(Metrics.showViewPriceTopLabelRight)
            make.height.equalTo(Metrics.showViewSedanButtonHeight)
        }
        
        self.sLineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.sedanButton.snp.bottom).offset(Metrics.showViewSLineViewTop)
            make.left.equalToSuperview().offset(Metrics.showViewSLineViewLeft)
            make.right.equalToSuperview().offset(Metrics.showViewSLineViewRight)
            make.height.equalTo(Metrics.showViewLineViewHeight)
        }
        
        self.universalButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.sedanButton.snp.bottom).offset(Metrics.showViewUnivButtonTop)
            make.left.equalToSuperview().offset(Metrics.showViewPriceTopLabelLeft)
            make.right.equalToSuperview().offset(Metrics.showViewPriceTopLabelRight)
            make.height.equalTo(Metrics.showViewUnivButtonHeight)
        }
        
        self.uLineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.universalButton.snp.bottom).offset(Metrics.showViewSLineViewTop)
            make.left.equalToSuperview().offset(Metrics.showViewSLineViewLeft)
            make.right.equalToSuperview().offset(Metrics.showViewSLineViewRight)
            make.height.equalTo(Metrics.showViewLineViewHeight)
        }
        
        self.cabrioletButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.universalButton.snp.bottom).offset(Metrics.showViewUnivButtonTop)
            make.left.equalToSuperview().offset(Metrics.showViewPriceTopLabelLeft)
            make.right.equalToSuperview().offset(Metrics.showViewPriceTopLabelRight)
            make.height.equalTo(Metrics.showViewUnivButtonHeight)
        }
        
        self.cLineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.cabrioletButton.snp.bottom).offset(Metrics.showViewSLineViewTop)
            make.left.equalToSuperview().offset(Metrics.showViewSLineViewLeft)
            make.right.equalToSuperview().offset(Metrics.showViewSLineViewRight)
            make.height.equalTo(Metrics.showViewLineViewHeight)
        }
        
        self.furgonButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.cabrioletButton.snp.bottom).offset(Metrics.showViewUnivButtonTop)
            make.left.equalToSuperview().offset(Metrics.showViewPriceTopLabelLeft)
            make.right.equalToSuperview().offset(Metrics.showViewPriceTopLabelRight)
            make.height.equalTo(Metrics.showViewUnivButtonHeight)
        }
        
        self.fLineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.furgonButton.snp.bottom).offset(Metrics.showViewSLineViewTop)
            make.left.equalToSuperview().offset(Metrics.showViewSLineViewLeft)
            make.right.equalToSuperview().offset(Metrics.showViewSLineViewRight)
            make.height.equalTo(Metrics.showViewLineViewHeight)
        }
        
        self.calculatePriceButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.furgonButton.snp.bottom).offset(Metrics.showViewCalcButtonTop)
            make.left.equalToSuperview().offset(Metrics.showViewPriceTopLabelLeft)
            make.right.equalToSuperview().offset(Metrics.showViewPriceTopLabelRight)
            make.height.equalTo(Metrics.showViewCalcButtonHeight)
            make.width.equalTo(Metrics.showViewCalcButtonWidth)
        }
    }
    
    private func addSubviews() {
        self.addSubview(self.scrollView)
        self.addSubview(self.activityView)
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
        self.contentView.addSubview(self.sLineView)
        self.contentView.addSubview(self.uLineView)
        self.contentView.addSubview(self.cLineView)
        self.contentView.addSubview(self.fLineView)
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
        activityView.startAnimating()
    }
    
    func hideActivityIndicator() {
        self.activityView.stopAnimating()
    }
    
    func setDefaultCar(defaultCar: String) {
        self.imageView.image = UIImage(named: defaultCar)
    }
    
    func setCurrentCar(currentCar: String) {
        self.imageView.image = UIImage(named: currentCar)
    }
}
