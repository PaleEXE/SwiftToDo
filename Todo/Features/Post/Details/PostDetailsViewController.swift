import UIKit

class PostDetailsViewController: BaseViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var commentsContainerView: UIView!
    
    var post: Post?
    var commentsVC: CommentsViewController?
    
    init() {
        super.init(nibName: "PostDetailsViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Post Details"
        displayPostData()
        setUpComments()
    }

    private func displayPostData() {
        titleLabel.text = post?.title
        bodyLabel.text = post?.body
    }
    
    func setUpComments() {
        let controller = CommentsViewController(postId: post?.id)
        self.commentsVC = controller
        
        addChild(controller)
        controller.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        controller.view.frame = commentsContainerView.bounds
        commentsContainerView.addSubview(controller.view)
        controller.didMove(toParent: self)
    }
}
