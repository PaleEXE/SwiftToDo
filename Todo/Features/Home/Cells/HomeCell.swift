import UIKit

class HomeCell: UICollectionViewCell {
    static let identifier = "HomeCell"
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyles()
    }

    private func setupStyles() {
        contentView.backgroundColor = UIColor(named: "card")
        contentView.layer.cornerRadius = 20
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.secondaryLabel.withAlphaComponent(0.2).cgColor
        
        iconImageView.tintColor = .label
        titleLabel.textColor = .label
    }

    func configure(title: String, imageName: String) {
        titleLabel.text = title
        iconImageView.image = UIImage(systemName: imageName)
    }
}
