class UserDetailsViewModel {
    let user: User
    let postsVC: PostsViewController
    
    init(user: User) {
        self.user = user
        self.postsVC = PostsViewController(userId: user.id)
    }
}
