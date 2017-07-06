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
        }else if ws == .WS_FILMS{
            return self.parseFilms(value: data)
        }else{
            let couldBeNil: String? = nil
            let any: Any = couldBeNil as Any
            return any
        }
    }
    
    private func parsePeople(value: Any) -> ListPeopleVO
    {
        
        let listPeopleVO = ListPeopleVO()
        
        let json = JSON(value)
        
        let results = json["results"].arrayValue
            
        for result in results
        {
            let peopleVO = PeopleVO()
                
            peopleVO.name = result["name"].stringValue
                
            listPeopleVO.peopleArray.append(peopleVO)
        }
        
        return listPeopleVO
    }
    
    private func parseFilms(value: Any) -> FilmsListVO
    {
        let filmsListVO = FilmsListVO()
        
        let json = JSON(value)
        
        let results = json["results"].arrayValue
        
        for result in results
        {
            let filmVO = FilmVO()
            
            filmVO.title = result["title"].stringValue
            filmVO.episode_id = result["episode_id"].intValue
            
            let characters = result["characters"].arrayValue
            
            for character in characters
            {
                let peopleVO = PeopleVO()
                
                peopleVO.url_people = character.stringValue
                
                filmVO.characters.append(peopleVO)
            }
            
            filmsListVO.results.append(filmVO)
            
        }
        
        return filmsListVO
    }
    
}
