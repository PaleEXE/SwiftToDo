import Foundation

class PostsViewModel {
    var posts: [Post] = []
    var onPostsUpdated: (() -> Void)?
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
        APIService.shared.fetchPosts { [weak self] posts in
            DispatchQueue.main.async {
                self?.posts = posts
                self?.onPostsUpdated?()
            }
        }
    }
    
    func fetchUserPosts() {
        guard let userId = self.userId else { return }
        
        APIService.shared.fetchPosts { [weak self] posts in
            DispatchQueue.main.async {
                self?.posts = posts.filter { $0.userId == userId }
                self?.onPostsUpdated?()
            }
        }
    }
}
