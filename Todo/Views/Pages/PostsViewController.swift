import UIKit

class PostsViewController: BaseViewController {
    let tableView = UITableView()

    var posts: [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Posts"

        setupTableView()
        fetchPosts()
    }

    func setupTableView() {
        tableView.frame = view.bounds
        tableView.backgroundColor = .backgroundColor
        tableView.dataSource = self

        view.addSubview(tableView)
    }

    func fetchPosts() {
        APIService.shared.fetchPosts { [weak self] posts in
            DispatchQueue.main.async {
                self?.posts = posts
                self?.tableView.reloadData()
            }
        }
    }
}

extension PostsViewController: UITableViewDataSource {
    func tableView(
        _: UITableView,
        numberOfRowsInSection _: Int
    ) -> Int {
        posts.count
    }

    func tableView(
        _: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let post = posts[indexPath.row]

        cell.backgroundColor = .backgroundColor
        cell.textLabel?.textColor = .primaryText
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.body

        return cell
    }
}
