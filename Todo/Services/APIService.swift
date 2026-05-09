@preconcurrency import Alamofire
import Foundation

class APIService {
    static let shared = APIService()

    private init() {}

    let baseURL = "https://jsonplaceholder.typicode.com"

    func fetchTodos(
        completion: @escaping ([Todo]) -> Void
    ) {
        AF.request("https://jsonplaceholder.typicode.com/todos")
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
        AF.request("https://jsonplaceholder.typicode.com/users")
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
        AF.request("https://jsonplaceholder.typicode.com/posts")
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
}
