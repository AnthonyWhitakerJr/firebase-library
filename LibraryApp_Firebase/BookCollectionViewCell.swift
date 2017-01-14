//
//  BookCollectionViewCell.swift
//  LibraryApp_Firebase
//
//  Created by Anthony Whitaker on 1/13/17.
//  Copyright © 2017 Anthony Whitaker. All rights reserved.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bookCoverImageView: UIImageView!
    
    func configure(bookCover: UIImage) {
        bookCoverImageView.image = bookCover
    }

}
