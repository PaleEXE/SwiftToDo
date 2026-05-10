import UIKit

struct HomeOption {
    let title: String
    let image: String
    let destination: UIViewController
}

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let options: [HomeOption] = [
        HomeOption(title: "Todos", image: "checklist", destination: TodosViewController()),
        HomeOption(title: "Users", image: "person.2.fill", destination: UsersViewController()),
        HomeOption(title: "Posts", image: "doc.text.fill", destination: PostsViewController())
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        setupCollectionView()
    }

    private func setupCollectionView() {
        let nib = UINib(nibName: "HomeCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "HomeCell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.setCollectionViewLayout(createLayout(), animated: false)
    }

    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(120))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(120))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 18
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        let option = options[indexPath.item]
        cell.configure(title: option.title, imageName: option.image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destination = options[indexPath.item].destination
        navigationController?.pushViewController(destination, animated: true)
    }
}
