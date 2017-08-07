//
//  Styles.swift
//  StarWarsApi
//
//  Created by Erick Alberto Morales Ledesma on 15/07/17.
//  Copyright © 2017 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit

class Styles: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    public func setTableCellBorderAndShadow(view: UIView)
    {
        view.layer.borderWidth = 2.0
        view.layer.borderColor = UIColor.flatYellowDark.cgColor
        view.layer.cornerRadius = 6.0
        
        view.layer.shadowOffset = CGSize(width: 0, height: 6)
        view.layer.shadowRadius = 1.5
        view.layer.shadowOpacity = 0.2
    }

}
