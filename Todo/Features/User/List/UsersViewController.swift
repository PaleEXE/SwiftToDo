import UIKit
import RxSwift
import RxCocoa

class UsersViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!

    let vm = UsersViewModel()
    private let disposeBag = DisposeBag()

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
        bindViewModel()
        vm.fetchUsers()
    }
    
    func bindViewModel() {
        vm.users.observe(on: MainScheduler.instance)
            .bind(to: tableView.rx.items)  { tableView, row, user in
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
                ?? UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
                var content = cell.defaultContentConfiguration()
                content.text = user.name
                content.secondaryText = user.email
                content.textProperties.color = .primaryText
                content.secondaryTextProperties.color = .secondaryText
                cell.contentConfiguration = content
                cell.backgroundColor = .background
                return cell
            }
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(User.self)
            .subscribe(onNext: { [weak self] selectedUser in
                let vc = UserDetailsViewController(user: selectedUser)
                self?.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: disposeBag)
    }
}
