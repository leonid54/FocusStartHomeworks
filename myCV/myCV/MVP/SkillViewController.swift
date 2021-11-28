import UIKit
import SnapKit

final class SkillViewController: UIViewController {
    private var skillView: SkillView
    private var skillPresenter: SkillPresenter

    init() {
        self.skillView = SkillView(frame: UIScreen.main.bounds)
        self.skillPresenter = SkillPresenter()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        self.skillPresenter.loadView(controller: self, view: self.skillView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        self.view.addSubview(skillView)
    }
}
