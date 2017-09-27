//
//  MobileNumberViewController.swift
//  PermanentDataStorage
//
//  Created by Vinay Reddy Polati on 9/14/17.
//  Copyright © 2017 m1m2Solutions. All rights reserved.
//

import UIKit

class MobileNumberViewController: UIViewController{
    
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
   
    @IBAction func updateButtonAction(_ sender: UIButton) {
        let phoneNumber = mobileNumberTextField.text;
        if let phoneNumberStr = phoneNumber {
            if let phoneNumberInt = Int(phoneNumberStr) {
                phoneNumberLabel.text = String(phoneNumberInt);
                UserDefaults.standard.set(phoneNumberStr, forKey: "MobileNumber");
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        /* setup code*/
        let mobileNumberObj = UserDefaults.standard.object(forKey: "MobileNumber");
        if let mobileNUmber = mobileNumberObj as? String {
            phoneNumberLabel.text = mobileNUmber;
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
}
