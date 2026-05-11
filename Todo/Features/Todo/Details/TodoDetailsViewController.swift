import UIKit

class TodoDetailsViewController: BaseViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    var todo: Todo?

    init() {
        super.init(nibName: "TodoDetailsViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Todo Details"
        displayTodoData()
    }

    private func displayTodoData() {
        titleLabel.text = todo?.title
        statusLabel.text = todo?.completed == true ? "Completed" : "Not Completed"
    }
}
