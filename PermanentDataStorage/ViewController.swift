//
//  ViewController.swift
//  PermanentDataStorage
//
//  Created by Vinay Reddy Polati on 9/12/17.
//  Copyright © 2017 m1m2Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var employeeList:[Employee] = [];
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    
    let defaults = UserDefaults.standard;
    var list:[String] = [];
    
    @IBOutlet weak var employeesTableView: UITableView!
    
    @IBAction func commitButtonAction(_ sender: Any) {
        if let fullname = fullNameTextField.text {
            list.append(fullname);
            defaults.set(list, forKey: "EmployeesList");
            if let email = emailTextField.text {
                if let mobileNUmber = mobileNumberTextField.text{
                    if let mobile = Int64(mobileNUmber) {
                       let emp = Employee(fullName: fullname, emailId: email, mobileNumber: mobile);
                        employeeList.append(emp);
                        employeesTableView.reloadData();
                    }else{
                        print("looks like there is a problem with Mobile number:\(mobileNUmber) use only 10-13 digits");
                    }
                }else{
                    print("oops! use only digits for mobileNumber");
                }
            }else{
                print("Enter email id ")
            }
        }else{
            print("name field is Mandatory. ");
        }
    }
    
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return /*employeeList.count;*/ list.count;
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell");
        cell.textLabel?.text = /*employeeList[indexPath.row].fullName;*/
            list[indexPath.row];
        return cell;
    }
    
/*-------------------------------------------------------------------------------------*/
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let c1 = defaults.stringArray(forKey: "EmployeesList"){
            list = c1;
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

