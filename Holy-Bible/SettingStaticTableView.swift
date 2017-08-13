//
//  SettingStaticTableView.swift
//  Holy-Bible
//
//  Created by Ragaie alfy on 7/24/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class SettingStaticTableView: UITableViewController {
   
    
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    @IBOutlet weak var languageDropDown: DropDown!
    
    
    @IBOutlet weak var fontDropDown: DropDown!
    
    
    
    
    
    
    
    var myController : SettingStaticTableController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myController = SettingStaticTableController()
        myController.myView = self
        
        languageDropDown.dataSourceItem = myController.languageNames
        languageDropDown.delegate = myController
        languageDropDown.ID = "Language"
        languageDropDown.itemLabel.text = NSLocalizedString("Select item...", comment: "")
        

//        fontDropDown.delegate = myController
//        fontDropDown.dataSourceItem = myController.fontsName
//        fontDropDown.ID = "Font"
//        fontDropDown.itemLabel.text = NSLocalizedString("Select item...", comment: "")
//        
        setSelectItem()
    }
    
    
    
    
    
    func setSelectItem(){
    
        switch languageManger.currentAppleLanguage() {
        case  "en":/// english case
            
            languageDropDown.itemLabel.text = NSLocalizedString("English", comment: "")

            
            break
        case "ar":// arabic case
            
            languageDropDown.itemLabel.text = NSLocalizedString("Arabic", comment: "")

            break
        default:
            break
        }
    
    }
    
    
  
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        var language = (UserDefaults.standard.object(forKey: "AppleLanguages") as! NSArray)[0] as! String
        
        
        menuButton.action = nil
        if self.revealViewController() != nil {
            
            if language.contains("en"){
                menuButton.action = "revealToggle:"
                self.revealViewController().rightViewRevealWidth = 0
                print("language english ")
                
            }else if language.contains("ar"){
                
                self.revealViewController().rightViewRevealWidth = self.view.frame.size.width/3 * 2
                self.revealViewController().rearViewRevealWidth = 0
                menuButton.action =   "rightRevealToggle:"
                
                
            }
            
            
            
            menuButton.target = self.revealViewController()
            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
    }
    



}
