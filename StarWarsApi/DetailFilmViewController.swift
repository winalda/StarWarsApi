//
//  DetailFilmViewController.swift
//  StarWarsApi
//
//  Created by Erick Alberto Morales Ledesma on 16/07/17.
//  Copyright © 2017 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit

class DetailFilmViewController: UIViewController {

    @IBOutlet weak var viewFilm : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Film"

        viewFilm.image = UIImage(named: "episodio7")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
