//
//  BookController.swift
//  BookReview
//
//  Created by Michael Mecham on 6/30/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

class BookController {
    
    static let sharedController = BookController()
    
    private let kBooks = "storedBooks"
    
    var booksArray: [Book] = []
    
    init() {
        // TODO: - call load function
        loadFromPersistentStore()
    }
    
    // CRUD
    
    func addBook(title: String, author: String, review: String) {
        let book = Book(title: title, author: author, review: review)
        booksArray.append(book)
        saveToPersistentStore()
    }
    
    func removeBook(book: Book) {
        if let index = booksArray.indexOf(book) {
            booksArray.removeAtIndex(index)
            saveToPersistentStore()
        }
    }
    
    func saveToPersistentStore() {
        NSUserDefaults.standardUserDefaults().setObject(booksArray.map({$0.dictionaryCopy}), forKey: kBooks)
    }
    
    func loadFromPersistentStore() {
        guard let booksDicionaryArray = NSUserDefaults.standardUserDefaults().objectForKey(kBooks) as? [[String:AnyObject]] else {
            return
        }
        let books = booksDicionaryArray.flatMap{Book(dictionary:$0)}
        booksArray = books
    }

}

















