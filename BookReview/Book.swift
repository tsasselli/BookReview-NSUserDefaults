//
//  Book.swift
//  BookReview
//
//  Created by Michael Mecham on 6/30/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

class Book: Equatable {
    
    private let kTitle = "title"
    private let kAuthor = "author"
    private let kReview = "review"
    
    let title: String
    let author: String
    var review: String
    
    var dictionaryCopy: [String:AnyObject] {
        return [kTitle:title, kAuthor:author, kReview:review]
    }
    
    
    init(title: String, author: String, review: String) {
        self.title = title
        self.author = author
        self.review = review
    }
    
    init?(dictionary: [String:AnyObject]) {
        guard let title = dictionary[kTitle] as? String,
            author = dictionary[kAuthor] as? String,
            review = dictionary[kReview] as? String else {
                return nil
        }
        self.title = title
        self.author = author
        self.review = review
    }
}

func ==(lhs: Book, rhs: Book) -> Bool {
    return lhs.author == rhs.author && lhs.title == rhs.title && lhs.review == rhs.review
}

















