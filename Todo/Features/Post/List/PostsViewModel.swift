import Foundation
import RxSwift
import RxCocoa

class PostsViewModel {
    let posts = BehaviorRelay<[Post]>(value: [])
    private let disposeBag = DisposeBag()
    var userId: Int?
    
    init(userId: Int? = nil) {
        self.userId = userId
    }
    
    func fetchPosts() {
        if userId != nil {
            return fetchUserPosts()
        }
        return fetchAllPosts()
    }
    
    func fetchAllPosts() {
        APIService.shared.fetchPosts()
            .subscribe(onNext: { [weak self] fetchedPosts in
                self?.posts.accept(fetchedPosts)
            })
            .disposed(by: disposeBag)
    }
    
    func fetchUserPosts() {
        guard let userId = self.userId else { return }
        
        APIService.shared.fetchPosts()
            .subscribe(onNext: { [weak self] fetchedPosts in
                self?.posts.accept(fetchedPosts.filter{ $0.userId == userId })
            })
            .disposed(by: disposeBag)
    }
}
