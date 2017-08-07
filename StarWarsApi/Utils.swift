//
//  Utils.swift
//  StarWarsApi
//
//  Created by Erick Alberto Morales Ledesma on 09/07/17.
//  Copyright © 2017 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit

class Utils: NSObject {
    
    public func SnippetFunt()
    {
        for fontFamily in UIFont.familyNames {
            
            print("Font family name = \(fontFamily as String)");
            
            for fontName in UIFont.fontNames(forFamilyName: fontFamily as String) {
                
                print("- Font name = \(fontName)");
                
            }
            
            print("\n");
            
        }
        
    }

}
