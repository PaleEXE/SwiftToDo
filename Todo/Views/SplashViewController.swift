import UIKit

class SplashViewController: UIViewController {
    private let viewModel = SplashViewModel()

    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Icon")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        bindViewModel()

        viewModel.start()
    }

    private func setupUI() {
        view.backgroundColor = .backgroundColor

        view.addSubview(logoImageView)

        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 180),
            logoImageView.heightAnchor.constraint(equalToConstant: 180),
        ])
    }

    private func bindViewModel() {
        viewModel.onFinished = { [weak self] in
            self?.goToLogin()
        }
    }

    private func goToLogin() {
        let vc = LoginViewController()

        navigationController?.setViewControllers([vc], animated: true)
    }
}
