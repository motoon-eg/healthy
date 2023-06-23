import UIKit

class MyTableViewCell: UITableViewCell {
    private let myImageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitle1Label = UILabel()
    private let subtitle2Label = UILabel()
    private let subtitle3Label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        myImageView.contentMode = .scaleAspectFill
        myImageView.clipsToBounds = true
        contentView.addSubview(myImageView)
        
        titleLabel.font = .systemFont(ofSize: 17, weight: .bold)
        contentView.addSubview(titleLabel)
        
        subtitle1Label.font = .systemFont(ofSize: 14)
        contentView.addSubview(subtitle1Label)
        
        subtitle2Label.font = .systemFont(ofSize: 14)
        contentView.addSubview(subtitle2Label)
        
        subtitle3Label.font = .systemFont(ofSize: 14)
        contentView.addSubview(subtitle3Label)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        myImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        myImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        myImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        
        subtitle1Label.translatesAutoresizingMaskIntoConstraints = false
        subtitle1Label.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 16).isActive = true
        subtitle1Label.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        subtitle1Label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        
        subtitle2Label.translatesAutoresizingMaskIntoConstraints = false
        subtitle2Label.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 16).isActive = true
        subtitle2Label.topAnchor.constraint(equalTo: subtitle1Label.bottomAnchor, constant: 4).isActive = true
        subtitle2Label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        
        subtitle3Label.translatesAutoresizingMaskIntoConstraints = false
        subtitle3Label.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 16).isActive = true
        subtitle3Label.topAnchor.constraint(equalTo: subtitle2Label.bottomAnchor, constant: 4).isActive = true
        subtitle3Label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
    }
    
    func configure(with viewModel: SavedRecipe) {
        myImageView.image = viewModel.recipeImageUrl
        titleLabel.text = viewModel.title
        subtitle1Label.text = viewModel.rating != nil ? "Rating: \(viewModel.rating!)" : ""
        subtitle2Label.text = viewModel.chefName != nil ? "Chef: \(viewModel.chefName!)" : ""
        subtitle3Label.text = viewModel.cookingTime != nil ? "Cooking Time: \(viewModel.cookingTime!) minutes" : ""
    }
}
