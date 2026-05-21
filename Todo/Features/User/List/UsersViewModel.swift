import Foundation
import RxSwift
import RxCocoa

class UsersViewModel {
    let users = BehaviorRelay<[User]>(value: [])
    private let disposeBag = DisposeBag()
    func fetchUsers() {
        APIService.shared.fetchUsers()
            .subscribe(onNext: { [weak self] ferchedUsers in
                self?.users.accept(ferchedUsers)
            })
            .disposed(by: disposeBag)
    }
}
