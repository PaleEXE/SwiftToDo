import UIKit

class HomeCell: UICollectionViewCell {
    static let identifier = "HomeCell"
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyles()
        registerForThemeChanges()
    }

    private func setupStyles() {
        contentView.backgroundColor = UIColor(named: "card")
        contentView.layer.cornerRadius = 20
        contentView.layer.borderWidth = 1
        updateBorderColor()
        
        iconImageView.tintColor = .primaryText
        titleLabel.textColor = .primaryText
    }

    private func registerForThemeChanges() {
        registerForTraitChanges([UITraitUserInterfaceStyle.self]) { (self: Self, previousTraitCollection) in
            self.updateBorderColor()
        }
    }

    private func updateBorderColor() {
        contentView.layer.borderColor = UIColor.primaryText.withAlphaComponent(0.2).cgColor
    }

    func configure(title: String, imageName: String) {
        titleLabel.text = title
        iconImageView.image = UIImage(systemName: imageName)
    }
}
