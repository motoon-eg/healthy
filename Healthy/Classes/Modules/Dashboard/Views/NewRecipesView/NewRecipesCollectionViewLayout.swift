import UIKit

final class NewRecipesCollectionViewLayout: UICollectionViewCompositionalLayout {

    // Custom initializer to create the desired layout
    convenience init(itemWidthPercentage: CGFloat) {
        let layout = Self.createLayout(itemWidthPercentage: itemWidthPercentage)
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.scrollDirection = .horizontal
        self.init(section: layout, configuration: configuration)
    }

    private static func createLayout(itemWidthPercentage: CGFloat) -> NSCollectionLayoutSection {
        // Item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        // Group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(itemWidthPercentage),
            heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item]
        )

        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 8.0, leading: 8.0, bottom: 8.0, trailing: 8.0)
        section.interGroupSpacing = 20.0

        // Return the layout section
        return section
    }
}
