//
//  Employee.swift
//  PermanentDataStorage
//
//  Created by Vinay Reddy Polati on 9/12/17.
//  Copyright © 2017 m1m2Solutions. All rights reserved.
//

import Foundation

class Employee{
    let fullName:String;
    let emailId:String;
    let mobileNumber:Int64;
    
    /* initializer or constructor. */
    init(fullName:String, emailId:String, mobileNumber:Int64) {
        self.fullName = fullName;
        self.emailId = emailId;
        self.mobileNumber = mobileNumber;
    }
}
