//
//  ImageService.swift
//  LibraryApp_Firebase
//
//  Created by Anthony Whitaker on 1/14/17.
//  Copyright © 2017 Anthony Whitaker. All rights reserved.
//

import Foundation
//import Firebase
import UIKit

class ImageService {
    
    static let sharedInstance = ImageService()

    private let imageCache = NSCache<NSString, UIImage>()

    
//    let storage = FIRStorage.storage()
    
    func bookCover(for book: Book) -> UIImage {
        return #imageLiteral(resourceName: "bookPlaceholder")
    }
}
