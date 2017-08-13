//
//  TextSettingController.swift
//  Holy-Bible
//
//  Created by Ragaie alfy on 7/26/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class TextSettingController: NSObject ,UIPickerViewDelegate,UIPickerViewDataSource,UIPopoverPresentationControllerDelegate,selectColor{
    var selectTag : Int!
    var myView : TextSettingView!
    var myModel : TextSettingModel!
    var fontsName : [String]! =  ["andlso","arab3end","ArabDances","ARABIAN KNIGHT","ARABOLIC","BArabics","BArshia","BCompset","BDavat","BElham","BEsfhnBd","Besmellah_2","BFantezy","BFerdosi","BJadidBd","BKoodakO","Diwanltr","Taibaijan Bold","Taibaijan Italic","Taibaijan","Thabit","Besmellah_2"]
    
    
    var fontSizes : [String]! = []
    
    
    
    var selectFontName : String!
    
    var selectFontSize : CGFloat!

    override init(){
        
        super.init()
        
        
        
        
        
        
        myModel = TextSettingModel()
        
        
        for item in 20...80{
        
            fontSizes.append("\(item)")
        
        }
        
        
        
        
        for item in UIFont.familyNames{
            
            fontsName.append(item)
            
        }
        
        selectFontName  = fontsName[0]
        selectFontSize  = CGFloat.init(Float(self.fontSizes[0])!)
        

        
    }
    
    
    
    
    
    
    
    func setSavedData(){
    
        if UserDefaults.standard.object(forKey: "size") != nil && UserDefaults.standard.object(forKey: "font") != nil {
            
            
            var fontValue = UserDefaults.standard.object(forKey: "size")
            var fontNameValue = UserDefaults.standard.object(forKey: "font") as! String
            
            var fontSize =  CGFloat.init(fontValue as! Float)
            
            myView.textFontTest.font = UIFont.init(name:  fontNameValue , size: fontSize)
            
          //  print(fontSizes.count)
            
            
           print(fontSizes.index(of: (fontValue as! Int).description  ))
            
            print(fontsName.index(of: fontNameValue)!)
            
           
            myView.fontSizePickerView.selectRow(fontSizes.index(of:  (fontValue as! Int).description )!, inComponent: 0, animated: true)
            
            
           // print(fontsName.index(of: fontNameValue))
            
            myView.FontPickerView.selectRow(fontsName.index(of: fontNameValue)!, inComponent: 0, animated: true)
            
            
            
            
            
            
            selectFontName  = fontsName[fontsName.index(of:(fontNameValue as! String ) )!]
            selectFontSize  = CGFloat.init(Float(self.fontSizes[fontSizes.index(of: (fontValue as! Int).description  )!])!)
            

            
            
            
            
            
            
        }
        
        
        if UserDefaults.standard.object(forKey: "fontColor") != nil {
            
            
            myView.pickFontColorButton.backgroundColor  = NSKeyedUnarchiver.unarchiveObject(with: UserDefaults.standard.data(forKey: "fontColor")!) as? UIColor
        }
        
        if UserDefaults.standard.object(forKey: "backgroundColor") != nil {
            
            myView.pickBackgroundColor.backgroundColor = NSKeyedUnarchiver.unarchiveObject(with: UserDefaults.standard.data(forKey: "backgroundColor")!) as? UIColor
            
            
            
            
        }
        
    
    
    }
    
    
    
    
    
    
    
    func saveData(_ sender: Any){
        
        UserDefaults.standard.set(selectFontName, forKey: "font")
        UserDefaults.standard.set(selectFontSize  , forKey: "size")
         myView.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    func pickFontColor(_ sender: UIButton){
        
        
        selectTag = sender.tag
        let popoverVC = myView.storyboard?.instantiateViewController(withIdentifier: "colorPickerPopover") as! ColorPickerViewController
        popoverVC.modalPresentationStyle = .popover
        popoverVC.preferredContentSize = CGSize(width: 284, height: 446)
        if let popoverController = popoverVC.popoverPresentationController {
            popoverController.sourceView = sender
            popoverController.sourceRect = CGRect(x: 0, y: 0, width: 85, height: 30)
            popoverController.permittedArrowDirections = .any
            popoverController.delegate = self
            
            
          popoverVC.delegate = self
        }
        myView.present(popoverVC, animated: true, completion: nil)
    }
    
    
    
    
    
    // Override the iPhone behavior that presents a popover as fullscreen
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        // Return no adaptive presentation style, use default presentation behaviour
        return .none
    }
    
    func colorPicked(selectColor: UIColor) {
        
        
        if selectTag == 0{
        
            myView.pickFontColorButton.backgroundColor = selectColor
            

            UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: selectColor), forKey: "fontColor")

        }
        else{
        
            myView.pickBackgroundColor.backgroundColor = selectColor

            UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: selectColor), forKey: "backgroundColor")

        }
        
        
        print("picked color   ---- >  \(selectColor)")
    }
  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 0 {
        
        
            return fontsName.count
        }
        else {
        
            return fontSizes.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
//        myView.textFontTest.font = UIFont.init(name: fontName, size:   CGFloat.init(fontSize!))
//        
//        myView.textFontTest.text = "Holy Bible   الكتاب المقدس"
//        
        if pickerView.tag == 0 {
            
            
            selectFontName =   fontsName[row]

        }
        else {
            
            selectFontSize = CGFloat.init(Float(self.fontSizes[row])!)
        }
        
        myView.textFontTest.font = UIFont.init(name: selectFontName, size:   selectFontSize)

        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0 {
            
            
            return fontsName[row]
        }
        else {
            
            return fontSizes[row]
        }
        
       
        
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
}
