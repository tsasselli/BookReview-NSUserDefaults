//
//  BookDetailViewController.swift
//  BookReview
//
//  Created by Michael Mecham on 6/30/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var notesBodyText: UITextView!
    
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let book = book {
            self.title = book.title
            updateWithBook(book)
        } else {
            self.title = "New Book"
        }
    }
    
    func updateWithBook(book: Book) {
        titleTextField.text = book.title
        authorTextField.text = book.author
        notesBodyText.text = book.review
    }
    
    // MARK: - Action Button
    @IBAction func saveButtonTapped(sender: AnyObject) {
        guard let title = titleTextField.text,
            author = authorTextField.text,
            review = notesBodyText.text else {
             return
        }
        BookController.sharedController.addBook(title, author: author, review: review)
        navigationController?.popViewControllerAnimated(true)
    }
}











