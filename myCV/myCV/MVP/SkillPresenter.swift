import UIKit

final class SkillPresenter {
    private let model = SkillModel()
    private weak var controller: SkillViewController?
    private weak var view: SkillView?

    func loadView(controller: SkillViewController, view: SkillView) {
        self.controller = controller
        self.view = view
        self.view?.configure()
        self.view?.backgroundColor = .white
        self.presentSkillText()
    }
    
    func presentSkillText() {
        let modelData = self.model.getSkillText()
        let presentData = SkillPresentModel(devExperienceText: "\(modelData.devExperienceText)", descDevExperienceText: "\(modelData.descDevExperienceText)", languageExperienceText: "\(modelData.languageExperienceText)", descLanguageExperienceText: "\(modelData.descLanguageExperienceText)", myExpectText: "\(modelData.myExpectText)", descMyExpectText: "\(modelData.descMyExpectText)")
        self.view.setContent(model: presentData)
    }
}

