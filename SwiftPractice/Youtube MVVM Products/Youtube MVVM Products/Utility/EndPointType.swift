//
//  EndPointType.swift
//  Youtube MVVM Products
//
//  Created by Nidhi on 10/03/24.
//

import Foundation

enum HttpMethods:String{
    case get = "GET"
    case post = "POST"
}

protocol EndPointType {
    
    var path:String { get }
    var baseUrl:String { get }
    var Url:URL? { get }
    var method:HttpMethods { get }
    
}

enum EndPointItems {
    case products // Module
}


extension EndPointItems:EndPointType {
    
    var path: String {
        switch self {
        case .products:
            return ""
        }
    }
    
    var baseUrl: String {
        return ""
    }
    
    var Url: URL? {
        return URL(string: "\(baseUrl)\(path)")
    }
    
    var method: HttpMethods {
        switch self {
            
        case .products:
            return .get
        }
    }
    
    
    
    
}
