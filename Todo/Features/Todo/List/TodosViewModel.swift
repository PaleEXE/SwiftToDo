import Foundation
import RxSwift
import RxCocoa

class TodosViewModel {
    let todos = BehaviorRelay<[Todo]>(value: [])
    private let disposeBag = DisposeBag()

    func fetchTodos() {
        APIService.shared.fetchTodos()
            .subscribe(onNext: { [weak self] fetchedTodos in
                self?.todos.accept(fetchedTodos)
            })
            .disposed(by: disposeBag)
    }
}
