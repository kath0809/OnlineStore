//
//  URLRequest+OnlineStore.swift
//  OnlineStore
//
//  Created by Karima Thingvold on 25/09/2024.
//

import Foundation


extension URLRequest {
    
    static func standard(url: URL) -> URLRequest {
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "GET" // evt PUT, DELETE...
        urlRequest.allHTTPHeaderFields = ["Content-Type": "application/json",
                                          "Accept": "application/json"]
        urlRequest.timeoutInterval = 10
        
        return urlRequest
    }
}
