//
//  AddBookcontroller.swift
//  FinalExam
//
//  Created by jamespoyu on 2016/7/22.
//  Copyright © 2016年 AlphaCamp. All rights reserved.
//

import UIKit
import Firebase

class AddBookcontroller: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var addressField: UITextField!
    
    @IBOutlet weak var phonenumberField: UITextField!
    
    @IBOutlet weak var webSiteField: UITextField!
    
    @IBOutlet weak var briefIntroductionField: UITextField!
    
    @IBAction func addNewBook(sender: AnyObject) {
        let refData = FIRDatabase.database().reference()
        let refPost = refData.child("BookLists").childByAutoId()
    refPost.setValue(["BookName": nameField.text!,"Address": addressField.text!,"PhoneNumber": phonenumberField.text!,"BriefIntroduction" : briefIntroductionField.text!,"Website": webSiteField.text!])

        
        
    }
    
    
    
    
    
    
}
