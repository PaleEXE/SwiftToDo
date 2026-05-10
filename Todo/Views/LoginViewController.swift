import UIKit

class LoginViewController: UIViewController {
    let usernameField = UITextField()
    let passwordField = UITextField()
    let eyeButton = UIButton(type: .system)
    let loginButton = UIButton(type: .system)

    let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Login"
        view.backgroundColor = .backgroundColor

        setupUsernameField()
        setupPasswordField()
        setupLoginButton()
        setupStackView()
    }

    func setupUsernameField() {
        usernameField.placeholder = "Username"
        usernameField.borderStyle = .none
        usernameField.backgroundColor = .cardColor
        usernameField.textColor = .primaryText
        usernameField.tintColor = .primaryColor
        usernameField.layer.cornerRadius = 12
        usernameField.layer.borderWidth = 1
        usernameField.layer.borderColor = UIColor.secondaryText.cgColor
        usernameField.attributedPlaceholder = NSAttributedString(
            string: "Username",
            attributes: [
                .foregroundColor: UIColor.secondaryText,
            ]
        )

        usernameField.setLeftPadding(12)

        usernameField.heightAnchor.constraint(equalToConstant: 50).isActive = true

        usernameField.addTarget(
            self,
            action: #selector(onChangeText),
            for: .editingChanged
        )
    }

    func setupPasswordField() {
        passwordField.placeholder = "Password"
        passwordField.borderStyle = .none
        passwordField.isSecureTextEntry = true
        passwordField.backgroundColor = .cardColor
        passwordField.textColor = .primaryText
        passwordField.tintColor = .primaryColor
        passwordField.layer.cornerRadius = 12
        passwordField.layer.borderWidth = 1
        passwordField.layer.borderColor = UIColor.secondaryText.cgColor
        passwordField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [
                .foregroundColor: UIColor.secondaryText,
            ]
        )

        passwordField.setLeftPadding(12)

        passwordField.heightAnchor.constraint(equalToConstant: 50).isActive = true

        passwordField.addTarget(
            self,
            action: #selector(onChangeText),
            for: .editingChanged
        )

        eyeButton.setImage(
            UIImage(systemName: "eye.slash"),
            for: .normal
        )

        eyeButton.tintColor = .secondaryText

        eyeButton.addTarget(
            self,
            action: #selector(togglePassword),
            for: .touchUpInside
        )

        passwordField.rightView = eyeButton
        passwordField.rightViewMode = .always
    }

    @objc func togglePassword() {
        passwordField.isSecureTextEntry.toggle()

        let imageName = passwordField.isSecureTextEntry
            ? "eye.slash"
            : "eye"

        eyeButton.setImage(
            UIImage(systemName: imageName),
            for: .normal
        )
    }

    func setupLoginButton() {
        loginButton.configuration = .filled()

        loginButton.configuration?.baseBackgroundColor = .primaryColor
        loginButton.configuration?.baseForegroundColor = .primaryText
        loginButton.configuration?.cornerStyle = .large

        loginButton.setTitle("Login", for: .normal)

        loginButton.isEnabled = false
        loginButton.alpha = 0.6

        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        loginButton.addTarget(
            self,
            action: #selector(handleLogin),
            for: .touchUpInside
        )
    }

    func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.backgroundColor = .secondaryColor.withAlphaComponent(0.15)

        stackView.layer.cornerRadius = 20
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor.secondaryText.withAlphaComponent(0.2).cgColor

        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.addArrangedSubview(usernameField)
        stackView.addArrangedSubview(passwordField)
        stackView.addArrangedSubview(loginButton)

        stackView.isLayoutMarginsRelativeArrangement = true

        stackView.layoutMargins = UIEdgeInsets(
            top: 24,
            left: 24,
            bottom: 24,
            right: 24
        )

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            stackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 24
            ),

            stackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -24
            ),
        ])
    }

    @objc func onChangeText() {
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""

        loginButton.isEnabled =
            !username.isEmpty &&
            !password.isEmpty

        loginButton.alpha = loginButton.isEnabled ? 1.0 : 0.6
    }

    @objc func handleLogin() {
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""

        if username == "Jaradat", password == "AwsAws" {
            navigationController?.setViewControllers(
                [HomeViewController()],
                animated: true
            )

        } else {
            let alert = UIAlertController(
                title: "Login Failed",
                message: "Invalid username or password",
                preferredStyle: .alert
            )

            alert.view.tintColor = .primaryColor

            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: .destructive
                )
            )

            present(alert, animated: true)
        }
    }
}

extension UITextField {
    func setLeftPadding(_ amount: CGFloat) {
        let paddingView = UIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: amount,
                height: frame.size.height
            )
        )

        leftView = paddingView
        leftViewMode = .always
    }
}
