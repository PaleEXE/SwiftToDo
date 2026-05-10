import UIKit

class UserDetailsViewController: BaseViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var user: User?
    var userPosts: [Post]?
    let vm = PostsViewModel()
    
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
    
    func setUpData() {
        nameLabel.text = user?.name
        emailLabel.text = user?.email
    }
    
    func setUpPosts() {
        let postsVC = PostsViewController(userId: user?.id)
        addChild(postsVC)
        view.addSubview(postsVC.view)
        postsVC.didMove(toParent: self)
        
        postsVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postsVC.view.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 30),
            postsVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postsVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postsVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
