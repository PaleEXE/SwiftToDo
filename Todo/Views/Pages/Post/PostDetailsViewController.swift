import UIKit

class PostDetailsViewController: BaseViewController {
    var post: Post?
    var comments: [Comment]?
    
    let vm = PostCommentsViewModel()
    
    let titleLabel = UILabel()
    let bodyLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Post Details"
        
        if let post {
            vm.fetchPostComments(postId: post.id)
        }
        
        setUpUI()
        setUpComments()
    }
    
    func setUpUI() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = .primaryText
        bodyLabel.textColor = .primaryText

        view.addSubview(titleLabel)
        view.addSubview(bodyLabel)
        
        titleLabel.text = post?.title
        bodyLabel.text = post?.body
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 50
            ),
            bodyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bodyLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: 20
            ),
        ])
    }
    
    func setUpComments() {
        let commentsVC = CommentsViewController(postId: post?.id)
        addChild(commentsVC)
        
        view.addSubview(commentsVC.view)
        
        commentsVC.didMove(toParent: self)
        commentsVC.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            commentsVC.view.topAnchor.constraint(
                equalTo: bodyLabel.bottomAnchor,
                constant: 30
            ),
            commentsVC.view.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            commentsVC.view.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            commentsVC.view.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            )
        ])
    }
}

