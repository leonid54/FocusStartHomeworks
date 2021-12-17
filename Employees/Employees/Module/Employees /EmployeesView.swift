import UIKit
import SnapKit
import RealmSwift

protocol IEmployeesView: AnyObject {
    var onTouchedHandler: ((String) -> Void)? { get set }
    func setupInitialState()
}

final class EmployeesView: UIViewController {
    private lazy var presenter: EmployeesPresenter = {
           return EmployeesPresenter(view: self)
    }()
    private var tableView: UITableView = UITableView()
    private var addButton = UIButton()
    var onTouchedHandler: ((String) -> Void)?
    let realm = try! Realm()
    var items: Results<Employee>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.configure()
        self.presenter.onViewReady()
        self.items = realm.objects(Employee.self)
    }
}

private extension EmployeesView {
    
    private func configure() {
        self.setConfig()
        self.addDelegate()
        self.addSubviews()
        self.setConstraint()
    }
    
    private func addSubviews() {
        self.view.addSubview(self.addButton)
        self.view.addSubview(self.tableView)
    }

    private func addDelegate() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    private func setConfig() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Добавить", style: .plain, target: self, action: #selector(addCompany(_:)))
        self.tableView.showsVerticalScrollIndicator = false
        self.addButton.setTitle("Add", for: .normal)
    }

    private func setConstraint() {
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    @objc func addCompany(_ sender: AnyObject) {
        self.addAlert()
        }
    
    func addAlert() {
        let alert = UIAlertController(title: "Добавление нового сотрудника", message: "", preferredStyle: .alert)
        
        var nameField: UITextField?
        alert.addTextField { textField in
            nameField = textField
            textField.placeholder = "Имя"
        }
        
        var ageField: UITextField?
        alert.addTextField { textField in
            ageField = textField
            textField.placeholder = "Возраст"
        }
        
        var expField: UITextField?
        alert.addTextField { textField in
            expField = textField
            textField.placeholder = "Опыт работы"
        }
        let saveAction = UIAlertAction(title: "Сохранить", style: .default) { action in
            guard let name = nameField?.text , !name.isEmpty else { return }
            guard let age = ageField?.text , !age.isEmpty else { return }
            let exp = expField?.text

            let task = Employee()
            task.name = name
            task.age = age
            task.experience = exp
            
            try! self.realm.write {
                self.realm.add(task)
            }
            self.tableView.insertRows(at: [IndexPath.init(row: self.items.count-1, section: 0)], with: .automatic)
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive, handler: nil)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}

extension EmployeesView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        self.onTouchedHandler?(item.name)
    }
    
     func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let editingRow = items[indexPath.row]
                
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { _,_ in
            try! self.realm.write {
                self.realm.delete(editingRow)
                tableView.reloadData()
            }
            
        }
        
        return [deleteAction]
    }
}

extension EmployeesView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if items.count != 0 {
            return items.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = EmployeesViewCell()
        cell.configure()
        let item = items[indexPath.row]
        cell.nameLabel.text = item.name
        cell.ageLabel.text = item.age
        cell.expLabel.text = item.experience
        return cell
    }
}

extension EmployeesView: IEmployeesView {
    func setupInitialState() {
        self.navigationController?.title = "Employees"
    }
}
