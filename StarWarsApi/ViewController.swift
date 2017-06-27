//
//  ViewController.swift
//  StarWarsApi
//
//  Created by Erick Alberto Morales Ledesma on 13/06/17.
//  Copyright © 2017 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WSCallerDelegate {

    var exaple : WebServicesFacade?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        exaple = WebServicesFacade()
        
        exaple?.getPeopleList(urlList: "http://pokeapi.co/api/v2/pokemon/").delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   func didReceiveData(data: NSData, ws:WebService)
    {
        let parsers : Parsers = Parsers()
        parsers.parseInfo(data: data, ws: ws)
        print("Hola YES")
    }
    
    func didReceiveError(error: NSError, ws:WebService)
    {
        print("Hola NO")
    }


}

