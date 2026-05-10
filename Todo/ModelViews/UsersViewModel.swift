import Foundation

class UsersViewModel {
    var users: [User] = []
    var onUsersUpdated: (() -> Void)?
    
    func fetchUsers() {
        APIService.shared.fetchUsers { [weak self] users in
            DispatchQueue.main.async {
                self?.users = users
                self?.onUsersUpdated?()
            }
        }
    }
}
