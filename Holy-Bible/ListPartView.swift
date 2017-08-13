//
//  ListPartView.swift
//  Holy-Bible
//
//  Created by Ragaie alfy on 7/25/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class ListPartView: UIViewController {

    
    
    
    @IBOutlet weak var tableListView: UITableView!
    var myController : ListPartController!
    var part : String! 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myController = ListPartController()
        myController.myView = self
        
       
        
        if part != nil && part == "new"{
        
                self.title = NSLocalizedString("New Testment", comment: "")
            
            myController.myModel.list = myController.myModel.newTestment

      
        } else  if part != nil && part == "old"{
            
            self.title = NSLocalizedString("Old Testment", comment: "")
            myController.myModel.list = myController.myModel.OldTestment
        }
        
        tableListView.delegate = myController
        tableListView.dataSource = myController
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBar.isHidden = false
    }

}
