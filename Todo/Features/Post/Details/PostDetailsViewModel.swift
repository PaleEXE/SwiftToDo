class PostDetailsViewModel {
    var post: Post
    var commentsVC: CommentsViewController
    
    init(post: Post) {
        self.post = post
        self.commentsVC = CommentsViewController(postId: post.id)
    }
}
