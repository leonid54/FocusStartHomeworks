import UIKit

final class PickViewController: UIViewController {
    private var pickView: IPickView
    private var pickPresenter: IPickPresenter
    
    struct Dependencies {
        let presenter: IPickPresenter
    }
    
    init(dependencies: Dependencies) {
        self.pickView = PickView(frame: UIScreen.main.bounds)
        self.pickPresenter = dependencies.presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.pickPresenter.loadView(controller: self, view: self.pickView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.view.addSubview(pickView as! UIView)
    }
}
