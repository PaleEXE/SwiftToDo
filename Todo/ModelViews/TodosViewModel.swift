import Foundation

class TodosViewModel {
    var todos: [Todo] = []
    var onTodosUpdated: (() -> Void)?

    func fetchTodos() {
        APIService.shared.fetchTodos { [weak self] todos in
            DispatchQueue.main.async {
                self?.todos = todos
                self?.onTodosUpdated?()
            }
        }
    }
}
