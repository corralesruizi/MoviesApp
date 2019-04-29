//
//  MoviePosterCollectionViewCell.swift
//  MoviesApp
//
//  Created by Developer on 4/24/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import UIKit

class MoviePosterCollectionViewCell: UICollectionViewCell {

    static var cellKey: String = "MoviePosterCollectionViewCell";
    static var cellNib: UINib = UINib(nibName: MoviePosterCollectionViewCell.cellKey, bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
