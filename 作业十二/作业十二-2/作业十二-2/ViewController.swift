//
//  ViewController.swift
//  作业十二-2
//
//  Created by guoxiaohan on 2018/12/15.
//  Copyright © 2018年 guoxiaohan. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillDisappear(_ animated: Bool) {
        appDelegate.saveContext()
    }
    
    @IBAction func add(_ sender: Any) {
        let p = Person(context: context)
        p.name = tfName.text
        p.phone = tfPhone.text
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
  
    

}

