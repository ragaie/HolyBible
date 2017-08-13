//
//  SettingStaticTableController.swift
//  Holy-Bible
//
//  Created by Ragaie alfy on 7/24/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class SettingStaticTableController: NSObject ,DropDownDelegate{
    
    
    var languageNames =  [NSLocalizedString("English", comment: ""),NSLocalizedString("Arabic", comment: "")]
    
    
//    var fontsName : [String]! =  ["andlso","arab3end","ArabDances","ARABIAN KNIGHT","ARABOLIC","BArabics","BArshia","BCompset","BDavat","BElham","BEsfhnBd","Besmellah_2","BFantezy","BFerdosi","BJadidBd","BKoodakO","Diwanltr","Taibaijan Bold","Taibaijan Italic","Taibaijan","Thabit","Besmellah_2"]
//    
//    
    
    var myView : SettingStaticTableView!
    
    override init(){
    
        super.init()
        
        
    }
    
    func dropDown(_ dropDown: DropDown, didSelectRowAt indexPath: IndexPath) {
        
        switch dropDown.ID {
        case "Language":
            switch indexPath.row {
                case 0:/// english case
                
                    if languageManger.currentAppleLanguage() == "ar"{
                        languageManger.setLaguageOfApplication(lang: "en")
                   
                    }
                    break
                case 1:// arabic case
                
                    if languageManger.currentAppleLanguage() == "en"{
                        languageManger.setLaguageOfApplication(lang: "ar")
                   
                    }
                    break
                default:
                    break
            }
            
        default:
            break
        }
        
        
    }

}




//extension UILabel {
//    
//    var substituteFontName : String {
//        get { return self.font.fontName }
//        set { self.font = UIFont(name: newValue, size: self.font.pointSize) }
//    }
//    
//}


