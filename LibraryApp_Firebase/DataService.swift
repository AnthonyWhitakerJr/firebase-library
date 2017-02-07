//
//  DataService.swift
//  LibraryApp_Firebase
//
//  Created by Anthony Whitaker on 1/14/17.
//  Copyright © 2017 Anthony Whitaker. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class DataService {
    
    static let sharedInstance = DataService()
    private static let ref = Ref()
    
    init() {
        FIRDatabase.database().persistenceEnabled = true
    }
    
    func books(completion: @escaping (_: Array<Book>) -> ()) {
        DataService.ref.books.observe(.value, with: { snapshot in
            var books = Array<Book>()
            if snapshot.value != nil {
                if let bookData = snapshot.value as? Dictionary<String, Dictionary<String, Any>> {
                    for (isbn, data) in bookData {
                        if let book = Book(isbn: isbn, data: data) {
                            books.append(book)
                        }
                    }
                }
            }
            completion(books)
        })
    }
    
    struct Ref {
        let database: FIRDatabaseReference
        let books: FIRDatabaseReference
        let users: FIRDatabaseReference
        
        var currentUser: FIRDatabaseReference? {
            let uid = FIRAuth.auth()?.currentUser?.uid
            if let uid = uid {
                return users.child(uid)
            }
            
            return nil
        }
        
        fileprivate init(){
            database = FIRDatabase.database().reference()
            books = database.child("books")
            users = database.child("users")
        }
    }
}
