//
//  BookUserData.swift
//  LibraryApp_Firebase
//
//  Created by Anthony Whitaker on 1/13/17.
//  Copyright © 2017 Anthony Whitaker. All rights reserved.
//

import Foundation

class BookUserData {
    
    let isbn: String
    var currentPage: Int
    
    init(isbn: String, currentPage: Int) {
        self.isbn = isbn
        self.currentPage = currentPage
    }
    
    convenience init?(isbn: String, data: Dictionary<String, Int>) {
        if let currentPage = data["currentPage"] {
            self.init(isbn: isbn, currentPage: currentPage)
        } else {
            return nil
        }
    }
    
    func asDictionary() -> Dictionary<String, Int> {
        let result: Dictionary<String, Int> = [
            "currentPage": self.currentPage
        ]
        
        return result
    }
}

// users:
//      Fred:
//          books:
//              978-3-16-148410-0:
//                  currentPage: 1
//              978-1-56619-909-4:
//                  currentPage: 2
//      Barney:
//          books:
//              978-3-16-148410-0:
//                  currentPage: 2
