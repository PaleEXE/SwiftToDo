import UIKit

class SplashViewController: UIViewController {

    private let vm = SplashViewModel()

    @IBOutlet weak var logoImageView: UIImageView!

    init() {
        super.init(nibName: "SplashViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .background

        bindViewModel()

        vm.start()
    }

    private func bindViewModel() {
        vm.onFinished = { [weak self] in
            self?.goToLogin()
        }
    }

    private func goToLogin() {
        let vc = LoginViewController()

        navigationController?.setViewControllers([vc], animated: true)
    }
}
