import Alamofire
import Foundation

class APIService {
    static let shared = APIService()

    private init() {}

    let baseURL = "https://jsonplaceholder.typicode.com"

    func fetchTodos(
        completion: @escaping ([Todo]) -> Void
    ) {
        AF.request("\(baseURL)/todos")
            .validate()
            .response { response in
                guard let data = response.data else {
                    completion([])
                    return
                }

                do {
                    let todos = try JSONDecoder().decode([Todo].self, from: data)
                    completion(todos)

                } catch {
                    print(error)
                    completion([])
                }
            }
    }

    func fetchUsers(
        completion: @escaping ([User]) -> Void
    ) {
        AF.request("\(baseURL)/users")
            .validate()
            .response { response in
                guard let data = response.data else {
                    completion([])
                    return
                }

                do {
                    let users = try JSONDecoder().decode([User].self, from: data)
                    completion(users)

                } catch {
                    print(error)
                    completion([])
                }
            }
    }

    func fetchPosts(
        completion: @escaping ([Post]) -> Void
    ) {
        AF.request("\(baseURL)/posts")
            .validate()
            .response { response in
                guard let data = response.data else {
                    completion([])
                    return
                }
                
                do {
                    let posts = try JSONDecoder().decode([Post].self, from: data)
                    completion(posts)

                } catch {
                    print(error)
                    completion([])
                }
            }
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
