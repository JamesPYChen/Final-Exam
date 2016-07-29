//
//  detailViewController.swift
//  FinalExam
//
//  Created by jamespoyu on 2016/7/25.
//  Copyright © 2016年 AlphaCamp. All rights reserved.
//

import UIKit
import WebKit
class detailViewController: UIViewController{
    @IBOutlet weak var detailImageView: UIImageView!
    
    var detailBookList : Book?
    
    @IBOutlet weak var detailIntro: UILabel!
    @IBOutlet weak var detailBookName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    var detailBookInfo: Book?
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func webAction(sender: AnyObject) {
        let webView = WKWebView(frame:UIScreen.mainScreen().bounds)
        self.view.addSubview(webView)
        let url = NSURL(string: (detailBookList?.Website!)!)
        
        print(detailBookList?.Website!)
        print("url: \(url)")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        
        //        let url = NSURL(string: "\(detailBookList?.Website!)")
        //        UIApplication.sharedApplication().openURL(url!)
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        if segue.identifier == "mapSegue"{
            let destinationViewController = segue.destinationViewController as! MapViewController
            destinationViewController.detailBook = detailBookList
            
        }
        
        
        
        
    }
}