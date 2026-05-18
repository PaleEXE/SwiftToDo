import UIKit

struct HomeOption {
    let title: String
    let image: String
    let destination: UIViewController
}

class HomeViewModel {
    let options: [HomeOption] = [
        HomeOption(title: "Todos", image: "checklist", destination: TodosViewController()),
        HomeOption(title: "Users", image: "person.2.fill", destination: UsersViewController()),
        HomeOption(title: "Posts", image: "doc.text.fill", destination: PostsViewController())
    ]

}
