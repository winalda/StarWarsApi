//
//  WSCaller.swift
//  StarWarsApi
//
//  Created by Erick Alberto Morales Ledesma on 14/06/17.
//  Copyright © 2017 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

protocol WSCallerDelegate: class
{
    func didReceiveData(data: NSData, ws:WebService)
    func didReceiveError(error: NSError, ws:WebService)
}

class WSCaller: NSObject
{
    weak var delegate: WSCallerDelegate!
    
    public func executeService(alamofire: DataRequest, ws:WebService)
    {
        alamofire.validate().responseJSON()
        {
            respose in
            
            switch respose.result
            {
            
            case .success:
                
                if let value = respose.result.value
                {
                    let json = JSON(value)
                    
                    print(json)
                }
                
                break
                
            case .failure(let error):
                
                print(error)
                
                break
            }
        }
    }
}
