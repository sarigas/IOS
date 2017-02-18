//
//  AddItemViewController.swift
//  WhatILike
//
//  Created by Guest User on 18/02/17.
//  Copyright © 2017 Guest User. All rights reserved.
//

import UIKit
protocol changeValueDelegate {
    func updateData(data: FruitModel)
}

class AddItemViewController: UIViewController {

    
    @IBOutlet weak var fName: UILabel!
    @IBOutlet weak var fDesc: UILabel!
    @IBOutlet weak var fTitle: UILabel!
    
    @IBOutlet weak var desctext: UITextView!
    @IBOutlet weak var ftitle: UITextField!
    @IBOutlet weak var ftext: UITextField!
    var delegate: changeValueDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   

    @IBAction func fSave(_ sender: Any) {
        
        if ftext.text == "" || ftitle.text == "" || desctext.text == "" {
            
            AlertMessage(Input: "Please fill all the fields.")
            
        }else if !isValidInput(Input: ftext.text!) {
            
            AlertMessage(Input: "Name field should contain Letters, Digits or Underscores are only.")
            
        }else if !isValidInput(Input: ftitle.text!){
            
            AlertMessage(Input: "Subtitle field should contain Letters, Digits or Underscores are only.")
            
        }else{
            
            let model = FruitModel.init(fname: ftext.text!, fphoto: nil, fsubtitle: ftitle.text!, fdescription: desctext.text!);
            
            self.delegate?.updateData(data: model);
            
            _ = navigationController?.popViewController(animated: true)
        }
        
    }
    
    func AlertMessage(Input:String){
        let alertController = UIAlertController(title: "Error", message: Input, preferredStyle: UIAlertControllerStyle.alert) //Replace UIAlertControllerStyle.Alert by UIAlertControllerStyle.alert
        
        // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
            print("OK")
        }
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func isValidInput(Input:String) -> Bool {
        let RegEx = "\\A\\w{1,20}\\z"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: Input)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
