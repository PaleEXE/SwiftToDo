import UIKit

class UsersViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!

    let vm = UsersViewModel()

    init() {
        super.init(nibName: "UsersViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Users"

        setupTableView()
        vm.fetchUsers()
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self

        bindViewModel()
    }
    
    func bindViewModel() {
        vm.onUsersUpdated = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension UsersViewController: UITableViewDataSource {
    func tableView(
        _: UITableView,
        numberOfRowsInSection _: Int
    ) -> Int {
        vm.users.count
    }

    func tableView(
        _: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)

        let user = vm.users[indexPath.row]

        cell.backgroundColor = .background
        cell.textLabel?.textColor = .primaryText
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email

        return cell
    }
}

extension UsersViewController: UITableViewDelegate {
    func tableView(
        _: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let selectedUser = vm.users[indexPath.row]
        let vc = UserDetailsViewController(user: selectedUser)
        navigationController?.pushViewController(vc, animated: true)
    }
}
