import UIKit

class PostDetailsViewController: BaseViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var post: Post?

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
    }

    private func displayPostData() {
        titleLabel.text = post?.title
        bodyLabel.text = post?.body
    }
}
