import UIKit

class TodoDetailsViewController: BaseViewController {
    var todo: Todo?

    let titleLabel = UILabel()
    let statusLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Todo Details"

        setupUI()
    }

    func setupUI() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = .primaryText
        statusLabel.textColor = .primaryText

        view.addSubview(titleLabel)
        view.addSubview(statusLabel)

        titleLabel.text = todo?.title
        statusLabel.text = todo?.completed == true
            ? "Completed"
            : "Not Completed"

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 50
            ),
            statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statusLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: 20
            ),
        ])
    }
}
