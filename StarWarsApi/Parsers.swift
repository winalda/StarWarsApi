//
//  Parsers.swift
//  StarWarsApi
//
//  Created by Erick Alberto Morales Ledesma on 15/06/17.
//  Copyright © 2017 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit

class Parsers: NSObject {

    public func parseInfo(data: NSData, ws:WebService)
    {
        switch ws
        {
            case .WS_PEOPLE:
                self.parsePeople(data: data)
            break
        }
    }
    
    private func parsePeople(data: NSData)
    {
        do
        {
            //var peopleVO = PeopleVO()
            
            let parsedData = try JSONSerialization.jsonObject(with: data as Data) as! [String:Any]
            
            let arrayPeple = parsedData["results"] as! [NSArray:Any]
            
            print("\(arrayPeple)")
            
            /*for value in arrayPeple
            {
                peopleVO.name = value["name"]
            }*/
            
            
        } catch let error as NSError {
            print(error)
        }
    }
    
}
