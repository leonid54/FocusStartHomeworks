import UIKit

final class MyInfoViewController: UIViewController {
    private var myInfoView: MyInfoView?
    private var myInfoModel: MyInfoModel?
    
    init() {
        self.myInfoView = MyInfoView(frame: UIScreen.main.bounds)
        self.myInfoModel = MyInfoModel()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        self.myInfoView?.loadView(controller: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        self.myInfoView?.configure()
        self.myInfoView?.backgroundColor = .white
        if let myInfoView = myInfoView {
            self.view.addSubview(myInfoView)
        }
    }
    
    func presentLabelText() {
        let modelData = self.myInfoModel?.getLabelText()
        let presentData = PresentationModel(presentationNameText: "\(modelData?.nameText)", presentationSurnameText: "\(modelData?.surnameText)", presentationAgeText: "\(modelData?.ageText)", presentationEducationText: "\(modelData?.educationText)", presentationCityText: "\(modelData?.cityText)")
//        self.myInfoModel
    }
}
