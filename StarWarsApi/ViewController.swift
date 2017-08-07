
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
    private var filmsListVO : FilmsListVO?
    private var contCell : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webServiceFacade = WebServicesFacade()
        
        self.contCell = 0
        
        self.tableView?.delegate = self
        self.tableView?.dataSource = self

        self.title = "Star Wars Films"
        
        self.navigationController?.navigationBar.barTintColor = UIColor.flatBlack
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.flatYellow]

        self.tableView?.backgroundColor = UIColor.black
        webServiceFacade?.getFilmsList(urlList: "\(Constans.urlDefault)\(Constans.urlFilms)").delegate = self
        
        self.tableView?.register(UINib(nibName:"PeopleTableViewCell", bundle:nil), forCellReuseIdentifier:"PeopleTableViewCell")
        
        self.view.backgroundColor = UIColor.black
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didReceiveData(value: Any, ws:WebService)
    {
        
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let count = filmsListVO?.results.count
        {
            return count
        }else{
            return 0
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    //Tamaño de la celda
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 75.0;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let rect = CGRect(x: 15, y: 0, width: ((self.tableView?.frame.size.width))!-15, height: 15.0)
        
        let viewHader = UIView.init(frame: rect)
        
        viewHader.backgroundColor = UIColor.clear
        
        return viewHader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15.0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell: PeopleTableViewCell
        let identifierNameCell: String = "PeopleTableViewCell"
        
        cell = tableView.dequeueReusableCell(withIdentifier: identifierNameCell) as! PeopleTableViewCell
        
        cell.backgroundColor = UIColor.flatRed
        
        Styles().setTableCellBorderAndShadow(view: cell)
        
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        if let count = filmsListVO?.results.count
        {
            if self.contCell! < count
            {
                if let value = filmsListVO?.results[self.contCell!]
                {
                    cell.lblName?.text = value.title
                    
                    cell.lblNum?.text = "Episode \(String(Int(value.episode_id!)))"
                }
                
                self.contCell = self.contCell! + 1
            }
        }
        
        return cell
    }
    
    //UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailFilm = DetailFilmViewController()
        self.navigationController?.popToViewController(detailFilm, animated: true)
    }
}

