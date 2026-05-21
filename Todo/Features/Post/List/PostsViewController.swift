import UIKit
import RxSwift
import RxCocoa

class PostsViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let vm: PostsViewModel
    private let disposeBag = DisposeBag()
    
    init(userId: Int? = nil) {
        vm = PostsViewModel(userId: userId)
        super.init(nibName: "PostsViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        vm = PostsViewModel()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Posts"
        bindViewModel()
        vm.fetchPosts()
        
    }
    
    func bindViewModel() {
        vm.posts.observe(on: MainScheduler.instance)
            .bind(to: tableView.rx.items) { tableView, row, post in
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
                ?? UITableViewCell(style: .subtitle, reuseIdentifier: "cell")

                var content = cell.defaultContentConfiguration()
                content.text = post.title
                content.secondaryText = post.body
                content.textProperties.color = .primaryText
                content.secondaryTextProperties.color = .secondaryText
                cell.contentConfiguration = content
                cell.backgroundColor = .background
                return cell
            }
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Post.self)
            .subscribe(onNext: { [weak self] selectedPost in
                let cv = PostDetailsViewController(post: selectedPost)
                self?.navigationController?.pushViewController(cv, animated: true)
            })
            .disposed(by: disposeBag)
    }
}
