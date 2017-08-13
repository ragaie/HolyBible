//
//  TextSettingView.swift
//  Holy-Bible
//
//  Created by Ragaie alfy on 7/26/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class TextSettingView: UIViewController {

    @IBOutlet weak var textFontTest: UILabel!
    
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    
    
    @IBOutlet weak var FontPickerView: UIPickerView!
    
    
    @IBOutlet weak var fontSizePickerView: UIPickerView!
    
    var myController : TextSettingController!
    
    
    
    
    @IBOutlet weak var pickFontColorButton: UIButton!
    
    
    @IBOutlet weak var pickBackgroundColor: UIButtonExtender!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        myController = TextSettingController()
        myController.myView = self
        
        
        
        cancelBarButton.target = self
        cancelBarButton.action = "DismissView:"
        
        saveBarButton.target = myController
        saveBarButton.action = "saveData:"
        
        
        FontPickerView.dataSource = myController
        FontPickerView.delegate = myController
        fontSizePickerView.delegate = myController
        fontSizePickerView.dataSource = myController
        pickFontColorButton.addTarget(myController, action: "pickFontColor:", for: .touchUpInside)
        
        pickBackgroundColor.addTarget(myController, action: "pickFontColor:", for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        myController.setSavedData()

      
        
    }
    
    
    
    func DismissView(_ sender: Any){
        
      self.dismiss(animated: true, completion: nil)
    }
    
 
   


}
