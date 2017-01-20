//
//  Book.swift
//  LibraryApp_Firebase
//
//  Created by Anthony Whitaker on 1/13/17.
//  Copyright © 2017 Anthony Whitaker. All rights reserved.
//

import Foundation

class Book {
    
    let isbn: String
    let title: String
    let author: String
    let pages: Array<Page>
    
    init(isbn: String, title: String, author: String, pages: Array<Page>) {
        self.isbn = isbn
        self.title = title
        self.author = author
        self.pages = pages
    }
    
    convenience init?(isbn: String, data: Dictionary<String, Any>) {
        var pages = Array<Page>()
        let title = data["title"] as? String
        let author = data["author"] as? String
        
        if let pageArray = data["pages"] as? Array<Any> {
            for (pageNumber, contents) in pageArray.enumerated() {
                if let contents = contents as? Dictionary<String, String> {
                    if let page = Page(pageNumber: pageNumber, data: contents) {
                        pages.append(page)
                    }
                }
            }
            pages.sort()
        } else {
            let foo = data["pages"]
            let arr = foo is Array<Any>
            print("is array \(arr)")
            let dic = foo is Array<Dictionary<String, Any>>
            print("is array of dictionary \(dic)")
            print("XXXXXX: \(foo)")
            
            
        }

        
        if let title = title, let author = author {
            self.init(isbn: isbn, title: title, author: author, pages: pages)
        } else {
            return nil
        }
    }
    
    func asDictionary() -> Dictionary<String, Any> {
        var result: Dictionary<String, Any>  = [
            "title": title,
            "author": author
        ]
        
        var pageArray = Array<Dictionary<String, String>>()
        
        for page in pages {
            pageArray.append(page.asDictionary())
        }
        
        result["pages"] = pageArray
        
        return result
    }
}

//  books:
//      978-3-16-148410-0:
//          title: Some Book Title
//          pages:
//              1:
//                  text: Some page text. Blah blah blah.
//              2:
//                  text: More page text. Blah blah blah.
//      978-1-56619-909-4
//          title: Another Book Title
//          pages:
//              1:
//                  imageName: This image
//                  text: This page text. Blah blah blah.
//              2:
//                  imageName: That image
//                  text: That page text. Blah blah blah.
//              3:
//                  text: Continued page text. Blah blah blah.

