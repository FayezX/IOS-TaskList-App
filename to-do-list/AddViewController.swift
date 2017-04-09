//
//  AddViewController.swift
//  to-do-list
//
//  Created by Fayez Ahmed on 4/6/17.
//  Copyright © 2017 fizzrecords. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController {

    @IBOutlet var textbox: UITextField!
    
    @IBAction func save_pressed(_ sender: UIButton) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        
        if(textbox.text != ""){
            task.name = textbox.text!
            textbox.text = ""
        }
        
        sender.resignFirstResponder()
        
        //save data to core data
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
