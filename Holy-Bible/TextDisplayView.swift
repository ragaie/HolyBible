//
//  TextDisplayView.swift
//  Holy-Bible
//
//  Created by Ragaie alfy on 7/26/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit
class TextDisplayView: UIViewController {

    
    
    
    @IBOutlet weak var textDisplay: UITextView!
    
    
    @IBOutlet weak var settingBar: UIBarButtonItem!
    
    
    var myController : TextDisplayController!
    
    var partName : String!
    var index : Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myController = TextDisplayController()
        myController.myView = self
        settingBar.action = "showFontSetting:"
        settingBar.target = myController
        
        myController.ReadFileData(part: partName, index: index)
        readFile()
        
        
        // Do any additional setup after loading the view.
    }

 
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        
        
     
        
        if UserDefaults.standard.object(forKey: "size") != nil && UserDefaults.standard.object(forKey: "font") != nil {
            
         var fontSize =  CGFloat.init(UserDefaults.standard.object(forKey: "size") as! Float)
        
            textDisplay.font = UIFont.init(name: UserDefaults.standard.object(forKey: "font")  as! String , size: fontSize)
            
        }
        
        
        if UserDefaults.standard.object(forKey: "fontColor") != nil {
        
            
          textDisplay.textColor  = NSKeyedUnarchiver.unarchiveObject(with: UserDefaults.standard.data(forKey: "fontColor")!) as? UIColor
        }
        
        if UserDefaults.standard.object(forKey: "backgroundColor") != nil {
            
            textDisplay.backgroundColor = NSKeyedUnarchiver.unarchiveObject(with: UserDefaults.standard.data(forKey: "backgroundColor")!) as? UIColor
                
                
                

        }
        
       
        
    }

    
    
    
    func readFile() -> Void {

        

        
        
        
            //Romans //Genesis 
            if let rtfPath = Bundle.main.url(forResource: "Genesis", withExtension: "rtf") {
                do {
                    let attributedStringWithRtf:NSAttributedString = try NSAttributedString.init(url: rtfPath, options: [NSDocumentTypeDocumentAttribute:NSRTFTextDocumentType], documentAttributes: nil)
                    
                    print(attributedStringWithRtf.length)
               //print(attributedStringWithRtf)
                //    textDisplay.text
                        
                        
                        var str = attributedStringWithRtf.string
                    textDisplay.text = str
                    
                    print(str)
                    
                } catch {
                    print("We got an error \(error)") //or handle how you want
                }
            }
        
        
      //  var webView : UIWebView! = UIWebView.init()
        
    
        
      
 
    
    }

}
