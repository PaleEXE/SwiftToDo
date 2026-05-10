//
//  UserDetailsViewController.swift
//  Todo
//
//  Created by test on 09/05/2026.
//

import UIKit

class UserDetailsViewController: BaseViewController {
    var user: User?
    var userPosts: [Post]?
    
    let vm = PostsViewModel()
    
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "User Details"
        
        setUpUI()
        setUpPosts()
    }
    
    func setUpUI(){
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        nameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        nameLabel.textColor = .primaryText
        emailLabel.textColor = .primaryText

        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        
        nameLabel.text = user?.name
        emailLabel.text = user?.email
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 50
            ),
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailLabel.topAnchor.constraint(
                equalTo: nameLabel.bottomAnchor,
                constant: 20
            ),
        ])
    }
    
    func setUpPosts() {
        let postsVC = PostsViewController(userId: user?.id)
        addChild(postsVC)
        
        view.addSubview(postsVC.view)
        
        postsVC.didMove(toParent: self)
        postsVC.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            postsVC.view.topAnchor.constraint(
                equalTo: emailLabel.bottomAnchor,
                constant: 30
            ),

            postsVC.view.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),

            postsVC.view.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),

            postsVC.view.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            )
        ])
    }
}
