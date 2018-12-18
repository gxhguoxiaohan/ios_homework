//
//  PersonTableViewController.swift
//  作业十二-2
//
//  Created by guoxiaohan on 2018/12/15.
//  Copyright © 2018年 guoxiaohan. All rights reserved.
//

import UIKit
import CoreData

class PersonTableViewController: UITableViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var persons:[Person]?
    fileprivate func reloadData() {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        persons = try? context.fetch(fetch)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Hello world!"
    }
    override func viewWillAppear(_ animated: Bool) {
        reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return persons?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if let person = persons?[indexPath.row] {
            cell.textLabel?.text = person.name
        }
        // Configure the cell...
        
        return cell
    }
    
    
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let secVC = segue.destination as! DetailViewController
            
            if let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)
            {
                secVC.person = persons?[indexPath.row]
            }
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    
}
