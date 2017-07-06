
//  ViewController.swift
//  StarWarsApi
//
//  Created by Erick Alberto Morales Ledesma on 13/06/17.
//  Copyright © 2017 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WSCallerDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView : UITableView?
    private var webServiceFacade : WebServicesFacade?
    //var listpeopleVO : ListPeopleVO?
    private var filmsListVO : FilmsListVO?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webServiceFacade = WebServicesFacade()
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.title = "People"
        
        //webServiceFacade?.getPeopleList(urlList: "\(Constans.urlDefault)\(Constans.urlPeple)").delegate = self
        
        webServiceFacade?.getFilmsList(urlList: "\(Constans.urlDefault)\(Constans.urlFilms)").delegate = self
        
        self.tableView?.register(UINib(nibName:"PeopleTableViewCell", bundle:nil), forCellReuseIdentifier:"PeopleTableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didReceiveData(value: Any, ws:WebService)
    {
        /*let parsers : Parsers = Parsers()
        listpeopleVO = parsers.parseInfo(data: value, ws: ws) as? ListPeopleVO
        
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }*/
        
        if ws == .WS_FILMS
        {
            let parsers : Parsers = Parsers()
            
            filmsListVO = parsers.parseInfo(data: value, ws: ws) as? FilmsListVO
            
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }
        
    }
    
    func didReceiveError(error: Error, ws:WebService)
    {
        print(error)
    }

    //UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if let count = filmsListVO?.results.count
        {
            return count
        }else{
            return 0
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: PeopleTableViewCell
        let identifierNameCell: String = "PeopleTableViewCell"
        
        cell = tableView.dequeueReusableCell(withIdentifier: identifierNameCell) as! PeopleTableViewCell
        
        if let value = filmsListVO?.results[indexPath.row]
        {
            cell.lblName?.text = value.title
            cell.lblNum?.text = String(Int(value.episode_id!))
        }
        
        return cell
    }
    
    //UITableViewDelegate

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 75
    }
}

