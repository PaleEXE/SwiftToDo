import UIKit

class UserDetailsViewController: BaseViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var postsContainerView: UIView!
    
    let vm: UserDetailsViewModel
    
    init(user: User) {
        vm = UserDetailsViewModel(user: user)
        super.init(nibName: "UserDetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User Details"
        setUpData()
        setUpPosts()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        vm.postsVC.view.frame = postsContainerView.bounds
    }
    
    func setUpData() {
        nameLabel.text = vm.user.name
        emailLabel.text = vm.user.email
    }
    
    func setUpPosts() {
        addChild(vm.postsVC)
        vm.postsVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        vm.postsVC.view.frame = postsContainerView.bounds
        postsContainerView.addSubview(vm.postsVC.view)
        vm.postsVC.didMove(toParent: self)
    }
}
