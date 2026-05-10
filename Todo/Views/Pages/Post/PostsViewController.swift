import UIKit

class PostsViewController: BaseViewController {
    var userId: Int?
    let tableView = UITableView()
    
    let vm = PostsViewModel()
    
    init(userId: Int? = nil) {
        self.userId = userId
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Posts"

        setupTableView()
        
        if let userId {
            vm.fetchPosts(userId: userId)
        } else {
            vm.fetchPosts()
        }
        
    }

    func setupTableView() {
        tableView.frame = view.bounds
        tableView.backgroundColor = .backgroundColor
        tableView.dataSource = self
        tableView.delegate = self
        
        bindViewModel()
        
        view.addSubview(tableView)
    }
    
    func bindViewModel() {
        vm.onPostsUpdated = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension PostsViewController: UITableViewDataSource {
    func tableView(
        _: UITableView,
        numberOfRowsInSection _: Int
    ) -> Int {
        vm.posts.count
    }

    func tableView(
        _: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let post = vm.posts[indexPath.row]

        cell.backgroundColor = .backgroundColor
        cell.textLabel?.textColor = .primaryText
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.body

        return cell
    }
}

extension PostsViewController: UITableViewDelegate {
    func tableView(
        _: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let selectedPost = vm.posts[indexPath.row]

        let vc = PostDetailsViewController()
        vc.post = selectedPost

        navigationController?.pushViewController(vc, animated: true)
    }
}
