//
//  DetailViewController.swift
//  作业十二-2
//
//  Created by guoxiaohan on 2018/12/15.
//  Copyright © 2018年 guoxiaohan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbPhone: UILabel!
    
    var person:Person?
    override func viewDidLoad() {
        super.viewDidLoad()
        lbName.text = person?.name
        lbPhone.text = person?.phone
        // Do any additional setup after loading the view.
    }

}
