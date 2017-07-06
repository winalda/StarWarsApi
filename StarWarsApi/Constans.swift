//
//  Constans.swift
//  StarWarsApi
//
//  Created by Erick Alberto Morales Ledesma on 14/06/17.
//  Copyright © 2017 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit

class Constans: NSObject {
    
    public static let urlDefault: String = "http://swapi.co/api/"
    public static let urlPeple: String = "people/"
    public static let urlFilms: String = "films/"
}

public enum WebService {
    case WS_PEOPLE
    case WS_FILMS
}
