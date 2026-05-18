import UIKit

class TodoDetailsViewController: BaseViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    let vm: TodoDetailsViewModel

    init(todo: Todo) {
        vm = TodoDetailsViewModel(todo: todo)
        super.init(nibName: "TodoDetailsViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Todo Details"
        displayTodoData()
    }

    private func displayTodoData() {
        titleLabel.text = vm.todo.title
        statusLabel.text = vm.todo.completed == true ? "Completed" : "Not Completed"
    }
}
