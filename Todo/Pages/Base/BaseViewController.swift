

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .background

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "house"),
            style: .plain,
            target: self,
            action: #selector(goHome)
        )
    }

    @objc func goHome() {
        navigationController?.popToRootViewController(animated: true)
    }
}
