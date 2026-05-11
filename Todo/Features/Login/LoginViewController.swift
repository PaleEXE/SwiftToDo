import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!

    let eyeButton = UIButton(type: .system)

    init() {
        super.init(nibName: "LoginViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Login"
        view.backgroundColor = .background

        setUpFields()
        setupLoginButton()
        setupStackView()
    }
    
    func setUpFields() {
        setupUsernameField()
        setupPasswordField()
        
        usernameField.text = UserDefaults.standard.value(forKey: "username") as? String
        passwordField.text = UserDefaults.standard.value(forKey: "password") as? String
    }

    func setupUsernameField() {
        usernameField.borderStyle = .none
        usernameField.backgroundColor = .card
        usernameField.textColor = .primaryText
        usernameField.tintColor = .myPrimary

        usernameField.layer.cornerRadius = 12
        usernameField.layer.borderWidth = 1
        usernameField.layer.borderColor = UIColor.secondaryText.cgColor

        usernameField.attributedPlaceholder = NSAttributedString(
            string: "Username",
            attributes: [
                .foregroundColor: UIColor.secondaryText
            ]
        )

        usernameField.setLeftPadding(12)

        usernameField.addTarget(
            self,
            action: #selector(checkLoginButtonActivation),
            for: .editingChanged
        )
    }

    func setupPasswordField() {
        passwordField.borderStyle = .none
        passwordField.isSecureTextEntry = true
        passwordField.backgroundColor = .card
        passwordField.textColor = .primaryText
        passwordField.tintColor = .myPrimary

        passwordField.layer.cornerRadius = 12
        passwordField.layer.borderWidth = 1
        passwordField.layer.borderColor = UIColor.secondaryText.cgColor

        passwordField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [
                .foregroundColor: UIColor.secondaryText
            ]
        )

        passwordField.setLeftPadding(12)

        passwordField.addTarget(
            self,
            action: #selector(checkLoginButtonActivation),
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

        let imageName =
            passwordField.isSecureTextEntry
            ? "eye.slash"
            : "eye"

        eyeButton.setImage(
            UIImage(systemName: imageName),
            for: .normal
        )
    }

    func setupLoginButton() {
        loginButton.configuration = .filled()

        loginButton.configuration?.baseBackgroundColor = .myPrimary
        loginButton.configuration?.baseForegroundColor = .primaryText
        loginButton.configuration?.cornerStyle = .large

        loginButton.setTitle("Login", for: .normal)

        loginButton.isEnabled = false
        loginButton.alpha = 0.6

        loginButton.addTarget(
            self,
            action: #selector(handleLogin),
            for: .touchUpInside
        )
        checkLoginButtonActivation()
    }

    func setupStackView() {
        stackView.backgroundColor =
            .mySecondary.withAlphaComponent(0.15)

        stackView.layer.cornerRadius = 20
        stackView.layer.borderWidth = 1

        stackView.layer.borderColor =
            UIColor.secondaryText
            .withAlphaComponent(0.2)
            .cgColor
    }

    @objc func checkLoginButtonActivation() {
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""

        loginButton.isEnabled =
            !username.isEmpty &&
            !password.isEmpty

        loginButton.alpha =
            loginButton.isEnabled ? 1.0 : 0.6
    }

    @objc func handleLogin() {
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""

        if username == "Jaradat",
           password == "AwsAws" {
            
            UserDefaults.standard.set(usernameField.text, forKey: "username")
            UserDefaults.standard.set(passwordField.text, forKey: "password")
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

            alert.view.tintColor = .myPrimary

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
