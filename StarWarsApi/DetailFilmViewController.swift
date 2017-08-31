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
    
    @IBOutlet weak var imageFilm : UIImageView!
    @IBOutlet weak var txtViewTitleFile : UITextView!
    @IBOutlet weak var txtViewEpisodeNum : UITextView!
    @IBOutlet weak var txtViewDescriptionFilm : UITextView!
    @IBOutlet weak var lblDirector : UILabel!
    @IBOutlet weak var lblDate : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Film"

        viewFilm.image = UIImage(named: "episodio7")
        self.view.backgroundColor = UIColor.gray
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
