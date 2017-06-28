//
//  WSCaller.swift
//  StarWarsApi
//
//  Created by Erick Alberto Morales Ledesma on 14/06/17.
//  Copyright © 2017 Erick Alberto Morales Ledesma. All rights reserved.
//

import UIKit
import Alamofire

protocol WSCallerDelegate: class
{
    func didReceiveData(value: Any, ws:WebService)
    func didReceiveError(error: Error, ws:WebService)
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
                    self.delegate.didReceiveData(value: value, ws: ws)
                }
                
                break
                
            case .failure(let error):
                
                self.delegate.didReceiveError(error: error, ws: ws)
                
                break
            }
        }
    }
}
