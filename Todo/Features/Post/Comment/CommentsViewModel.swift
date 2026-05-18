import Foundation

class CommentsViewModel {
    var comments: [Comment] = []
    var onPostCommentsUpdated: (() -> Void)?
    let postId: Int
    
    init(postId: Int) {
        self.postId = postId
    }

    func fetchPostComments() {
        APIService.shared.fetchPostComments(postId: postId) { [weak self] comments in
            DispatchQueue.main.async {
                self?.comments = comments
                self?.onPostCommentsUpdated?()
            }
        }
    }
}
