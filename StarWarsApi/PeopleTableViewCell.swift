//
//  PeopleTableViewCell.swift
//  StarWarsApi
//
//  Created by Erick Alberto Morales Ledesma on 28/06/17.
//  Copyright © 2017 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName : UILabel?
    @IBOutlet weak var lblNum : UILabel?
    //@IBOutlet weak var viewCell : UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.lblName?.textColor = UIColor.flatYellowDark
        self.lblNum?.textColor = UIColor.flatYellowDark
        
        /*self.viewCell?.layer.borderWidth = 2.0
        self.viewCell?.layer.borderColor = UIColor.flatYellowDark.cgColor
        self.viewCell?.layer.cornerRadius = 8.0
        
        self.viewCell?.layer.shadowOffset = CGSize(width: 0, height: 2.5)
        self.viewCell?.layer.shadowRadius = 3.5
        self.viewCell?.layer.shadowOpacity = 2.0
        
        self.viewCell?.backgroundColor = UIColor.flatRed
        
        self.viewCell?.accessibilityNavigationStyle = UIAccessibilityNavigationStyle.automatic*/
        
        //self.viewCell?.alpha = 1
        // Configure the view for the selected state
    }
    
}
