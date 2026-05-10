import UIKit

class TodosViewController: BaseViewController {
    let tableView = UITableView()

    let vm = TodosViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Todos"

        setupTableView()
        bindViewModel()

        vm.fetchTodos()
    }

    func setupTableView() {
        tableView.frame = view.bounds
        tableView.backgroundColor = .backgroundColor
        tableView.dataSource = self
        tableView.delegate = self

        view.addSubview(tableView)
    }

    func bindViewModel() {
        vm.onTodosUpdated = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension TodosViewController: UITableViewDataSource {
    func tableView(
        _: UITableView,
        numberOfRowsInSection _: Int
    ) -> Int {
        vm.todos.count
    }

    func tableView(
        _: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = UITableViewCell(
            style: .subtitle,
            reuseIdentifier: nil
        )

        let todo = vm.todos[indexPath.row]

        cell.textLabel?.text = todo.title
        cell.backgroundColor =
            todo.completed
                ? .myGreen
                : .myRed

        cell.detailTextLabel?.text =
            todo.completed
                ? "Completed"
                : "Not Completed"

        return cell
    }
}

extension TodosViewController: UITableViewDelegate {
    func tableView(
        _: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let selectedTodo = vm.todos[indexPath.row]

        let vc = TodoDetailsViewController()
        vc.todo = selectedTodo

        navigationController?.pushViewController(vc, animated: true)
    }
}
