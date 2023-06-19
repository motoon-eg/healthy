//
//  SearchCollectionViewCell.swift
//  Healthy
//
//  Created by Abdallah on 19/06/2023.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    // MARK:  Outlets
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var ratingNumber: UILabel!
    @IBOutlet weak var recipyName: UILabel!
    @IBOutlet weak var chefName: UILabel!
    // MARK: Configuration
    func configureCell(with viewModel: ViewModel) {
        // Do view model integration...
    }
    
}

// MARK: ViewModel
extension SearchCollectionViewCell {
    struct ViewModel {
        let recipyName: String
        let chefName: String
        let rate: Float
        let imageUrl: URL?
    }
}
