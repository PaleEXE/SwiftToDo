import Foundation

class PostsViewModel {
    var posts: [Post] = []
    var onPostsUpdated: (() -> Void)?
    
    func fetchPosts() {
        APIService.shared.fetchPosts { [weak self] posts in
            DispatchQueue.main.async {
                self?.posts = posts
                self?.onPostsUpdated?()
            }
        }
    }
    
    func fetchPosts(userId: Int) {
        APIService.shared.fetchPosts { [weak self] posts in
            DispatchQueue.main.async {
                self?.posts = posts.filter { $0.userId == userId }
                self?.onPostsUpdated?()
            }
        }
    }
}
