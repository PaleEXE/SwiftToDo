import Alamofire
import Foundation
import RxSwift
import RxCocoa

class APIService {
    static let shared = APIService()

    private init() {}

    let baseURL = "https://jsonplaceholder.typicode.com"

    func fetchTodos() -> Observable<[Todo]> {
        Observable.create { observer in
            let request = AF.request("\(self.baseURL)/todos")
                .validate()
                .response { response in
                    guard let data = response.data else {
                        observer.onNext([])
                        observer.onCompleted()
                        return
                    }

                    do {
                        let todos = try JSONDecoder().decode([Todo].self, from: data)
                        observer.onNext(todos)
                        observer.onCompleted()
                    } catch {
                        print(error)
                        observer.onNext([])
                        observer.onCompleted()
                    }
                }
            
            return Disposables.create {
                request.cancel()
            }
        }
    }

    func fetchUsers() -> Observable<[User]> {
        return Observable.create({ observer in
            let request = AF.request("\(self.baseURL)/users")
                .validate()
                .response { resonse in
                    guard let data = resonse.data else {
                        observer.onNext([])
                        observer.onCompleted()
                        return
                    }
                    do {
                        let users = try JSONDecoder().decode([User].self, from: data)
                        observer.onNext(users)
                    } catch {
                        print(error)
                        observer.onNext([])
                    }
                    observer.onCompleted()
                }
            return Disposables.create {
                request.cancel()
            }
        })
    }

    func fetchPosts() -> Observable<[Post]> {
        return Observable.create({ observer in
            let request = AF.request("\(self.baseURL)/posts")
                .validate()
                .response { resonse in
                    guard let data = resonse.data else {
                        observer.onNext([])
                        observer.onCompleted()
                        return
                    }
                    do {
                        let posts = try JSONDecoder().decode([Post].self, from: data)
                        observer.onNext(posts)
                    } catch {
                        print(error)
                        observer.onNext([])
                    }
                    observer.onCompleted()
                }
            return Disposables.create {
                request.cancel()
            }
        })
    }
    
    func fetchPostComments (
        postId: Int, completion: @escaping ([Comment]) -> Void
    ) {
        AF.request("\(baseURL)/comments?postId=\(postId)")
            .validate()
            .response { response in
                guard let data = response.data else {
                    completion([])
                    return
                }
                
                do {
                    let comments = try JSONDecoder().decode([Comment].self, from: data)
                    completion(comments)

                } catch {
                    print(error)
                    completion([])
                }
            }
    }
}
