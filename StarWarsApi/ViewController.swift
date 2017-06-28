
//  ViewController.swift
//  StarWarsApi
//
//  Created by Erick Alberto Morales Ledesma on 13/06/17.
//  Copyright © 2017 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WSCallerDelegate {

    var exaple : WebServicesFacade?
    var listpeopleVO : ListPeopleVO?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        exaple = WebServicesFacade()
        
        exaple?.getPeopleList(urlList: "\(Constans.urlDefault)\(Constans.urlPeple)").delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didReceiveData(value: Any, ws:WebService)
    {
        let parsers : Parsers = Parsers()
        listpeopleVO = parsers.parseInfo(data: value, ws: ws) as? ListPeopleVO
        
        for people in (listpeopleVO?.peopleArray)!
        {
            if let value = people.name
            {
                print(value)
            }
        }
        
    }
    
    func didReceiveError(error: Error, ws:WebService)
    {
        print(error)
    }


}

