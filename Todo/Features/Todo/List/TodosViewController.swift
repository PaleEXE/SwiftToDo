import UIKit
import RxSwift
import RxCocoa

class TodosViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!

    let vm = TodosViewModel()
    private let disposeBag = DisposeBag()
    
    init() {
        super.init(nibName: "TodosViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Todos"
        bindViewModel()
        vm.fetchTodos()
    }

    func bindViewModel() {
        vm.todos
            .observe(on: MainScheduler.instance)
            .bind(to: tableView.rx.items) { tableView, row, todo in
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
                    ?? UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
                var content = cell.defaultContentConfiguration()
                content.text = todo.title
                content.secondaryText = todo.completed ? "Completed" : "Not Completed"
                cell.contentConfiguration = content
                
                cell.backgroundColor = todo.completed ? .myGreen : .myRed
                return cell
            }
            .disposed(by: disposeBag)

        tableView.rx.modelSelected(Todo.self)
            .subscribe(onNext: { [weak self] selectedTodo in
                let vc = TodoDetailsViewController(todo: selectedTodo)
                self?.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: disposeBag)
    }
}
