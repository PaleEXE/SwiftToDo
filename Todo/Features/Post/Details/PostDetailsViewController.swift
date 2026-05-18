import UIKit

class PostDetailsViewController: BaseViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var commentsContainerView: UIView!

    let vm: PostDetailsViewModel

    init(post: Post) {
        self.vm = PostDetailsViewModel(post: post)
        super.init(nibName: "PostDetailsViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Post Details"
        bindViewModel()
        setupComments()
    }

    private func bindViewModel() {
        titleLabel.text = vm.post.title
        bodyLabel.text = vm.post.body
    }

    private func setupComments() {
        addChild(vm.commentsVC)
        vm.commentsVC.view.frame = commentsContainerView.bounds
        vm.commentsVC.view.autoresizingMask = [
            .flexibleWidth,
            .flexibleHeight
        ]
        commentsContainerView.addSubview(vm.commentsVC.view)
        vm.commentsVC.didMove(toParent: self)
    }
}
