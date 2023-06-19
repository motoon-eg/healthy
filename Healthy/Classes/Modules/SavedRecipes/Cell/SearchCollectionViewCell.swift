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
    
    @IBOutlet weak var ratingView: UIView!{
        didSet{
            ratingView.layer.cornerRadius = ratingView.frame.height / 2
        }
    }
    
    // MARK: Configuration
    func configureCell(with viewModel: ViewModel) {
        // TODO: - [HT-62] Waiting for adding kingfisher To load image and set it to backImage.
        ratingNumber.text = viewModel.recipyName
        chefName.text = viewModel.chefName
        ratingNumber.text = "\(viewModel.ratingNumber)"
    }
    
}

// MARK: ViewModel
extension SearchCollectionViewCell {
    struct ViewModel {
        let recipyName: String
        let chefName: String
        let ratingNumber: Float
        let imageUrl: URL?
    }
}
