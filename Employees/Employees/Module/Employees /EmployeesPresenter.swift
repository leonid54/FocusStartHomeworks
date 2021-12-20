import UIKit

protocol IEmployeesPresenter{
    func onViewReady()
}

final class EmployeesPresenter {
    private var model = Employee()
    private weak var view: IEmployeesView?

    init(view: IEmployeesView) {
        self.view = view
    }
    
    func onViewReady() {
           self.view?.setupInitialState()
       }
}
