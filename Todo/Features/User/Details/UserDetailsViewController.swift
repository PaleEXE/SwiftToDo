import UIKit

class UserDetailsViewController: BaseViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var postsContainerView: UIView!
    
    var user: User?
    var postsVC: PostsViewController?
    
    init() {
        super.init(nibName: "UserDetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User Details"
        setUpData()
        setUpPosts()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        postsVC?.view.frame = postsContainerView.bounds
    }
    
    func setUpData() {
        nameLabel.text = user?.name
        emailLabel.text = user?.email
    }
    
    func setUpPosts() {
        let controller = PostsViewController(userId: user?.id)
        self.postsVC = controller
        
        addChild(controller)
        controller.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        controller.view.frame = postsContainerView.bounds
        postsContainerView.addSubview(controller.view)
        controller.didMove(toParent: self)
    }
}
