import UIKit

class CommentsViewController: BaseViewController {

    var postId: Int?

    let tableView = UITableView()
    let vm = PostCommentsViewModel()

    init(postId: Int? = nil) {
        self.postId = postId
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Comments"

        setupTableView()

        postId != nil
            ? vm.fetchPostComments(postId: postId!)
            : nil
    }

    func setupTableView() {
        tableView.frame = view.bounds
        tableView.backgroundColor = .background
        tableView.dataSource = self
        tableView.delegate = self

        bindViewModel()

        view.addSubview(tableView)
    }

    func bindViewModel() {
        vm.onPostCommentsUpdated = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension CommentsViewController: UITableViewDataSource {

    func tableView(
        _: UITableView,
        numberOfRowsInSection _: Int
    ) -> Int {
        vm.comments.count
    }

    func tableView(
        _: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)

        let comment = vm.comments[indexPath.row]

        cell.backgroundColor = .background
        cell.textLabel?.textColor = .primaryText

        cell.textLabel?.text = comment.name
        cell.detailTextLabel?.text = comment.body

        return cell
    }
}

extension CommentsViewController: UITableViewDelegate {

    func tableView(
        _: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
