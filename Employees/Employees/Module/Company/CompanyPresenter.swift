import UIKit

protocol ICompanyPresenter {
    func onViewReady()
}

final class CompanyPresenter {
    private var model = Company()
    private weak var view: ICompanyView?

    init(view: ICompanyView) {
        self.view = view
    }
    
    func onViewReady() {
           self.view?.setupInitialState()
       }
}
