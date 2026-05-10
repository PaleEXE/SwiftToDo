class HomeCell: UICollectionViewCell {
    static let identifier = "HomeCell"
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    private func setupUI() {
        backgroundColor = .card
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = UIColor.secondaryText.withAlphaComponent(0.2).cgColor
        
        iconImageView.tintColor = .primaryText
        iconImageView.contentMode = .scaleAspectFit
        
        titleLabel.textColor = .primaryText
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        titleLabel.textAlignment = .center

        let stack = UIStackView(arrangedSubviews: [iconImageView, titleLabel])
        stack.axis = .vertical
        stack.spacing = 12
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            iconImageView.widthAnchor.constraint(equalToConstant: 30)
        ])
    }

    func configure(title: String, imageName: String) {
        titleLabel.text = title
        iconImageView.image = UIImage(systemName: imageName)
    }
}