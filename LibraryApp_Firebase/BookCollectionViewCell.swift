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
    
    var book: Book!
    var imageService = ImageService.sharedInstance
    
    func configure(book: Book) {
        self.book = book
        imageService.bookCover(for: book) { bookCover in
            self.bookCoverImageView.image = bookCover
        }
    }

}
