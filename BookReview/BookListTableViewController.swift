//
//  BookListTableViewController.swift
//  BookReview
//
//  Created by Michael Mecham on 6/30/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import UIKit

class BookListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BookController.sharedController.booksArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("bookCell", forIndexPath: indexPath)
        let book = BookController.sharedController.booksArray[indexPath.row]
        cell.textLabel?.text = book.title
        cell.detailTextLabel?.text = book.author
        
        return cell
    }

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            let book = BookController.sharedController.booksArray[indexPath.row]
            BookController.sharedController.removeBook(book)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // How am I going to get there?
        if segue.identifier == "toDetailSegue" {
            
            // Where am I going?
            let bookDetailVC = segue.destinationViewController as? BookDetailViewController
            
            // What am I going to take? and where is it now?
            if let indexPath = tableView.indexPathForSelectedRow {
                let book = BookController.sharedController.booksArray[indexPath.row]
                
                // Did I bring it?
                bookDetailVC?.book = book
            }
        }
    }
    

}















