import UIKit

class HomeViewController: UIViewController {
    let todosButton = UIButton(type: .system)
    let postsButton = UIButton(type: .system)
    let usersButton = UIButton(type: .system)

    let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Home"
        view.backgroundColor = .backgroundColor

        setupStack()

        setupButton(
            button: todosButton,
            title: "Todos",
            image: "checklist",
            selector: #selector(goToTodos)
        )

        setupButton(
            button: usersButton,
            title: "Users",
            image: "person.2.fill",
            selector: #selector(goToUsers)
        )

        setupButton(
            button: postsButton,
            title: "Posts",
            image: "doc.text.fill",
            selector: #selector(goToPosts)
        )
    }

    func setupButton(
        button: UIButton,
        title: String,
        image: String,
        selector: Selector
    ) {
        var config = UIButton.Configuration.filled()

        config.title = title
        config.image = UIImage(systemName: image)
        config.imagePlacement = .top
        config.imagePadding = 12
        config.baseBackgroundColor = .cardColor
        config.baseForegroundColor = .primaryText
        config.cornerStyle = .large

        button.configuration = config
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor =
            UIColor.secondaryText.withAlphaComponent(0.2).cgColor
        button.heightAnchor.constraint(equalToConstant: 120).isActive = true
        button.addTarget(
            self,
            action: selector,
            for: .touchUpInside
        )

        stackView.addArrangedSubview(button)
    }

    func setupStack() {
        stackView.axis = .vertical
        stackView.spacing = 18
        stackView.backgroundColor =
            .secondaryColor.withAlphaComponent(0.15)
        stackView.layer.cornerRadius = 24
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor =
            UIColor.secondaryText.withAlphaComponent(0.2).cgColor
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(
            top: 24,
            left: 24,
            bottom: 24,
            right: 24
        )

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            stackView.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),
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

    @objc func goToTodos() {
        navigationController?.pushViewController(
            TodosViewController(),
            animated: true
        )
    }

    @objc func goToUsers() {
        navigationController?.pushViewController(
            UsersViewController(),
            animated: true
        )
    }

    @objc func goToPosts() {
        navigationController?.pushViewController(
            PostsViewController(),
            animated: true
        )
    }
}
