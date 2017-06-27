//
//  WebServicesFacade.swift
//  StarWarsApi
//
//  Created by Erick Alberto Morales Ledesma on 15/06/17.
//  Copyright © 2017 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit
import Alamofire

class WebServicesFacade: NSObject {

    public func getPeopleList(urlList: String) -> WSCaller
    {
        let wsCaller = WSCaller()
        
        let url = URL(string: urlList)!
        
        let alamofire = Alamofire.request(url, method: .get)
        
       wsCaller.executeService(alamofire: alamofire, ws: .WS_PEOPLE)
        
        return wsCaller
    }
    
}
