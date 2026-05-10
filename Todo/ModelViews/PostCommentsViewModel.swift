import Foundation

class PostCommentsViewModel {
    var comments: [Comment] = []
    var onPostCommentsUpdated: (() -> Void)?
    
    func fetchPostComments(postId: Int) {
        APIService.shared.fetchPostComments(postId: postId) { [weak self] comments in
            DispatchQueue.main.async {
                self?.comments = comments
                self?.onPostCommentsUpdated?()
            }
        }
    }
}
