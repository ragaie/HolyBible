//
//  ViewController.swift
//  SomeWorkTest
//
//  Created by Ragaie alfy on 5/10/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var menuButton: UIButton!
   
    
    @IBOutlet weak var oldButton: UIButtonExtender!
    
    @IBOutlet weak var newButton: UIButtonExtender!
   // @IBOutlet weak var texttest: UITextField!
    
   // @IBOutlet weak var TitleWork: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title =    NSLocalizedString("Chtar Demo", comment: "")

        
               newButton.setTitle(NSLocalizedString("New Testment", comment: ""), for: .normal)
            oldButton.setTitle(NSLocalizedString("Old Testment", comment: ""), for: .normal)

        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        
        SingleClass.swViewController = self.revealViewController()
       
        
        
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        
        
        
        newButton.addTarget(self, action: "ShowNewTestment:", for: .touchUpInside)
        oldButton.addTarget(self, action: "ShowOldTestment:", for: .touchUpInside)
        
        self.navigationController?.navigationBar.isHidden = true
    
       // print(UserDefaults.standard.object(forKey: "AppleLanguages"))
        var language = (UserDefaults.standard.object(forKey: "AppleLanguages") as! NSArray)[0] as! String
        
       
        
        
        
        if self.revealViewController() != nil {
            
            if language.contains("en"){
               // menuButton.action = "revealToggle:"
                
                menuButton.addTarget(self.revealViewController(), action: "revealToggle:", for: .touchUpInside)
                self.revealViewController().rightViewRevealWidth = 0
                self.revealViewController().rightRevealToggle(animated: false)
                print("language english ")
                
            }else if language.contains("ar"){
                
                self.revealViewController().rightViewRevealWidth = self.view.frame.size.width/3 * 2
                self.revealViewController().rearViewRevealWidth = 0
                
                menuButton.addTarget(self.revealViewController(), action: "rightRevealToggle:", for: .touchUpInside)

                
            }
         
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        

    }
    
    func ShowNewTestment(_ sender: Any){
    
    
        var nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "listMainView") as! ListPartView
        
        
        nextViewController.part = "new"
        self.navigationController?.pushViewController(nextViewController, animated: true)
        
    }
    
    
    func ShowOldTestment(_ sender: Any){
        
        var nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "listMainView") as! ListPartView
        nextViewController.part = "old"
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
}

        
   
    @IBAction func newtestmentButton(_ sender: Any) {
        
     
    }
    
    
    
    @IBAction func oldTestmentButton(_ sender: Any) {
        
    }
  
    
    

}

