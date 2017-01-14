//
//  ImageService.swift
//  LibraryApp_Firebase
//
//  Created by Anthony Whitaker on 1/14/17.
//  Copyright © 2017 Anthony Whitaker. All rights reserved.
//

import Foundation
import FirebaseStorage
import UIKit

class ImageService {
    
    static let sharedInstance = ImageService()
    
    private let imageCache = NSCache<NSString, UIImage>()

    let eightMegabytes: Int64 = 8 * 1024 * 1024
    
    let storage = FIRStorage.storage()
    
    func bookCover(for book: Book, completion: @escaping (_: UIImage) -> ()) {
        let bookCoverRef = storage.reference(withPath: "images/bookCovers/\(book.isbn).jpg")
        bookCoverRef.data(withMaxSize: eightMegabytes) { data, error in
            if let data = data {
                let image = UIImage(data: data) ?? #imageLiteral(resourceName: "bookPlaceholder")
                completion(image)
            } else {
                print("\(error)")
                completion(#imageLiteral(resourceName: "bookPlaceholder"))
            }
        }

    }
}
