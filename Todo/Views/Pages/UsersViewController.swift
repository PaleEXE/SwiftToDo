import UIKit

class UsersViewController: BaseViewController {
    let tableView = UITableView()

    var users: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Users"

        setupTableView()
        fetchUsers()
    }

    func setupTableView() {
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.backgroundColor = .backgroundColor

        view.addSubview(tableView)
    }

    func fetchUsers() {
        APIService.shared.fetchUsers { [weak self] users in
            DispatchQueue.main.async {
                self?.users = users
                self?.tableView.reloadData()
            }
        }
    }
}

extension UsersViewController: UITableViewDataSource {
    func tableView(
        _: UITableView,
        numberOfRowsInSection _: Int
    ) -> Int {
        users.count
    }

    func tableView(
        _: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)

        let user = users[indexPath.row]

        cell.backgroundColor = .backgroundColor
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email

        return cell
    }
}
