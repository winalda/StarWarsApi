//
//  Parsers.swift
//  StarWarsApi
//
//  Created by Erick Alberto Morales Ledesma on 15/06/17.
//  Copyright © 2017 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit
import SwiftyJSON

class Parsers: NSObject {

    public func parseInfo(data: Any, ws:WebService) -> Any
    {
    
        if ws == .WS_PEOPLE
        {
            return self.parsePeople(value: data)
        }else{
            let couldBeNil: String? = nil
            let any: Any = couldBeNil as Any
            return any
        }
    }
    
    private func parsePeople(value: Any) -> ListPeopleVO
    {
        
        let listPeopleVO = ListPeopleVO()
        
        do
        {
            let json = JSON(value)
            
            let results = json["results"].arrayValue
            
            for result in results
            {
                let peopleVO = PeopleVO()
                
                peopleVO.name = result["name"].stringValue
                
                listPeopleVO.peopleArray.append(peopleVO)
            }
            
        } catch {
            print("Erro jason")
        }
        
        return listPeopleVO
    }
    
}
