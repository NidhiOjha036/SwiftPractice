//
//  BaseApi.swift
//  AsyncAwaitProj
//
//  Created by Nidhi on 24/03/24.
//

import Foundation



enum UrlType{
    case developement
    case uat
    case live
}

var urlType = UrlType.developement

class BaseApi {
    
    static var baseApi:String? {
        switch urlType {
        case .developement:
            return "https://jsonplaceholder.typicode.com/"
        case .uat:
            return ""
        case .live:
            return ""
        }
    }
    
}
