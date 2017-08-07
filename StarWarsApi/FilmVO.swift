//
//  FilmVO.swift
//  StarWarsApi
//
//  Created by Erick Alberto Morales Ledesma on 05/07/17.
//  Copyright © 2017 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit

class FilmVO: NSObject {
    
    public var title: String?
    public var episode_id: Int?
    public var opening_crawl: String?
    public var director: String?
    public var release_data: String?
    public var characters: Array<PeopleVO> = []

}
