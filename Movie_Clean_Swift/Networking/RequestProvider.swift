//
//  RequestProvider.swift
//  Movie_Clean_Swift
//
//  Created by Álvaro Fernandes on 30/12/19.
//  Copyright © 2019 Álvaro Fernandes. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

protocol RequestProvider {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var httpVerb: HTTPMethod { get }
    var asURLRequest: URLRequest { get }
    var queryItems: [URLQueryItem] { get }
}

public enum MovieApi {
    case popular
    case newMovies
}

extension RequestProvider {

    var httpVerb: HTTPMethod {
        return .get
    }
    
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "api.themoviedb.org"
    }
    
    var path: String {
        return "/3/movie/"
    }
    
    var queryItems: [URLQueryItem] {
        return []
    }
    
    var asURLRequest: URLRequest {
        
        var components = URLComponents()
                components.scheme = scheme
                components.host = host
                components.path = path
                components.queryItems = queryItems

        var request = URLRequest(url: components.url!)
        request.httpMethod = httpVerb.rawValue

        return request

    }
    
}

extension Bundle {
    
    var scheme: String {
        return self.object(forInfoDictionaryKey: "Scheme") as! String
    }
    
    var host: String {
        return self.object(forInfoDictionaryKey: "Host") as! String
    }
    
}

extension Encodable {
    
    func toJSONData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
    
}

//https://api.themoviedb.org/3/movie/popular?api_key=760f4b73370f8305fcbb6952ed09618f&page=1

//https://api.themoviedb.org/3/movie/76341?api_key=760f4b73370f8305fcbb6952ed09618f&language=pt-BR
