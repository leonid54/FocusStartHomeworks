import UIKit

protocol IShowViewController: AnyObject {
    
}

final class ShowViewController: UIViewController {
    private var showView: IShowView
    private var showPresenter: IShowPresenter

    init(presenter: IShowPresenter) {
        self.showView = ShowView(frame: UIScreen.main.bounds)
        self.showPresenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.showPresenter.loadView(controller: self, view: self.showView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.view.addSubview(showView as! UIView)
    }
}
