
//  ViewController.swift
//  StarWarsApi
//
//  Created by Erick Alberto Morales Ledesma on 13/06/17.
//  Copyright © 2017 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WSCallerDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView : UITableView?
    var webServiceFacade : WebServicesFacade?
    var listpeopleVO : ListPeopleVO?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webServiceFacade = WebServicesFacade()
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.title = "People"
        
        webServiceFacade?.getPeopleList(urlList: "\(Constans.urlDefault)\(Constans.urlPeple)").delegate = self
        
        self.tableView?.register(UINib(nibName:"PeopleTableViewCell", bundle:nil), forCellReuseIdentifier:"PeopleTableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didReceiveData(value: Any, ws:WebService)
    {
        let parsers : Parsers = Parsers()
        listpeopleVO = parsers.parseInfo(data: value, ws: ws) as? ListPeopleVO
        
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
    
    func didReceiveError(error: Error, ws:WebService)
    {
        print(error)
    }

    //UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if let count = listpeopleVO?.peopleArray.count
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
        
        if let value = listpeopleVO?.peopleArray[indexPath.row].name{
            cell.lblName?.text = value
        }
        
        cell.lblNum?.text = String(indexPath.row + 1)
        
        return cell
    }
    
    //UITableViewDelegate

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 75
    }
}

