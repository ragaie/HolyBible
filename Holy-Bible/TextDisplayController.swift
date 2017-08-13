//
//  TextDisplayController.swift
//  Holy-Bible
//
//  Created by Ragaie alfy on 7/26/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit
import AVFoundation

class TextDisplayController: NSObject {

    var myView : TextDisplayView!
    
    var myModel : TextDisplayModel!
    override init(){
    
        super.init()
        
        myModel = TextDisplayModel()
    }
    
    
   func ReadFileData(part : String , index : Int){
    
    
    //Romans //Genesis
    
            var filename : String! = ""
            if part == "new"{
    
                filename =   myModel.newTestment[index] + languageManger.currentAppleLanguage()
    
            }else {
    
                filename =   myModel.OldTestment[index] + languageManger.currentAppleLanguage()
            }
    
            languageManger.currentAppleLanguage()
            if let rtfPath = Bundle.main.url(forResource: filename, withExtension: "rtf") {
                do {
                        let attributedStringWithRtf:NSAttributedString = try NSAttributedString.init(url: rtfPath, options: [NSDocumentTypeDocumentAttribute:NSRTFTextDocumentType], documentAttributes: nil)
            
            
                        var str = attributedStringWithRtf.string
                        myView.textDisplay.text = str
            
            
                        } catch {
                        print("We got an error \(error)") //or handle how you want
                        }
                    }
    
    
    
    }

    
    
    
    func showFontSetting(_ sender: Any){
        
      /*  let synth = AVSpeechSynthesizer()
        var myUtterance = AVSpeechUtterance(string: "")
        
        
        myUtterance = AVSpeechUtterance(string: myView.textDisplay.text)
        myUtterance.voice = AVSpeechSynthesisVoice(language: "ar-SA")
        
        
        myUtterance.rate = 0.3
        synth.speak(myUtterance)*/
        //Arabic (ar-SA)
        
        
        var viewControll = myView.storyboard?.instantiateViewController(withIdentifier: "settingIDMainView")
        
        myView.present(viewControll!, animated: true, completion: nil)
        
    }
    
 
}
