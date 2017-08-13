//
//  ListPartController.swift
//  Holy-Bible
//
//  Created by Ragaie alfy on 7/25/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class ListPartController: NSObject,UITableViewDelegate,UITableViewDataSource {

    
    var myView : ListPartView!
    var myModel : ListPartModel!
    
    
    
    
    override init(){
    
        super.init()
        
        myModel = ListPartModel()
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myModel.list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListViewCell
        
        
        cell.lableTitleData.text = myModel.list[indexPath.row]
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        //displayTextId
        var nextViewController = myView.storyboard?.instantiateViewController(withIdentifier: "displayTextId") as! TextDisplayView
        nextViewController.partName = myView.part
        nextViewController.index = indexPath.row
        
        myView.navigationController?.pushViewController(nextViewController, animated: true)
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
