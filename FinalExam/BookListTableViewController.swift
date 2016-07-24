//
//  BookListTableViewController.swift
//  FinalExam
//
//  Created by jamespoyu on 2016/7/24.
//  Copyright © 2016年 AlphaCamp. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage
import Firebase

class BookListTableViewController: UITableViewController {

    var bookLists = [Book]()
    
    @IBOutlet var tableViewList: UITableView!
    let cellIdentifier = "BookListTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewList.delegate = self
        tableViewList.dataSource = self
        tableViewList.estimatedRowHeight = 190
        tableViewList.rowHeight = UITableViewAutomaticDimension
        
        self.tableViewList.registerNib(UINib(nibName: "BookListTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        getBookdata()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bookLists.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! BookListTableViewCell
        
        cell.bookName.text = bookLists[indexPath.row].BookName

        // Configure the cell...

        return cell
    }
    
    func getBookdata(){
        let ref = FIRDatabase.database().reference()
        let postRef = ref.child("BookLists")
        postRef.observeEventType(.ChildAdded, withBlock: { (snapshot) in
            
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let bookList = Book()
                bookList.setValuesForKeysWithDictionary(dictionary)
                self.bookLists.append(bookList)
                self.tableViewList.reloadData()
                
                
            }
            
            
            }, withCancelBlock: nil)
    }

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("detailSegue", sender: bookLists[indexPath.row])
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailSegue"{
            
            if let indexPath = tableViewList.indexPathForSelectedRow{
                let destinationViewController = segue.destinationViewController as! detailViewController
                destinationViewController.detailBookInfo = bookLists[indexPath.row]
                
                print(destinationViewController.detailBookInfo)
            }
        }

        
    }
    

}
