//
//  ViewControllerSecreen.swift
//  StarWarsApi
//
//  Created by Erick Alberto Morales Ledesma on 09/07/17.
//  Copyright © 2017 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit

class ViewControllerSecreen: UIViewController {

    @IBOutlet weak var viewScreen: UIView?
    @IBOutlet weak var lblScreen: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.viewScreen?.backgroundColor = UIColor.flatGrayDark
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
