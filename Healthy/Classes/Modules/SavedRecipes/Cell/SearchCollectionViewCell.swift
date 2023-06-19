//
//  SearchCollectionViewCell.swift
//  Healthy
//
//  Created by Abdallah on 19/06/2023.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    // MARK:  Outlets

    
    // MARK: Configuration
    func configureCell(with viewModel: ViewModel) {
        // Do view model integration...
    }
    
}

// MARK: ViewModel
extension SearchCollectionViewCell {
    struct ViewModel {
        let recipeName: String
        let chefName: String
        let rate: Float
        let imageUrl: URL?
    }
}
