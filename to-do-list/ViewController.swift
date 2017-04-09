//
//  ViewController.swift
//  to-do-list
//
//  Created by Fayez Ahmed on 4/6/17.
//  Copyright © 2017 fizzrecords. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    var list : [Task] = []
    
    @IBOutlet var table_view: UITableView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        //get the data from core data
        GetData()
        
        //reload the table view
        table_view.reloadData()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell()
        
        let task = list[indexPath.row]
        cell.textLabel?.text = task.name!
        
        return (cell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func GetData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
           try list = context.fetch(Task.fetchRequest())
       
        }
        catch{
            print("error while fetching from core data")
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete{
            let task = list[indexPath.row]
            context.delete(task)
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            viewWillAppear(true)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table_view.dataSource = self
        table_view.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

