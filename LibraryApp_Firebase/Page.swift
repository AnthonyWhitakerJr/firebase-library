//
//  Page.swift
//  LibraryApp_Firebase
//
//  Created by Anthony Whitaker on 1/13/17.
//  Copyright © 2017 Anthony Whitaker. All rights reserved.
//

import Foundation

class Page: Comparable {
    
    let number: Int
    let text: String
    let imageName: String?
    
    init(pageNumber: Int, pageText: String, imageName: String? = nil) {
        self.number = pageNumber
        self.text = pageText
        self.imageName = imageName
    }
    
    convenience init?(pageNumber: Int, data contents: Dictionary<String, String>) {
        let text = contents["text"]
        let imageName = contents["imageName"]
        
        if let text = text {
            self.init(pageNumber: pageNumber, pageText: text, imageName: imageName)
        } else {
            return nil
        }
    }
    
    func asDictionary() -> Dictionary<String, String> {
        var contents: Dictionary<String, String> = [
            "text": self.text
        ]
        
        if let imageName = self.imageName {
            contents["imageName"] = imageName
        }
        
        return contents
    }
    
    // MARK: - Comparable
    public static func < (lhs: Page, rhs: Page) -> Bool {
        return lhs.number < rhs.number
    }
    
    public static func == (lhs: Page, rhs: Page) -> Bool {
        return lhs.number == rhs.number
    }
}
