//
//  HomeNewMovieProvider.swift
//  Movie_Clean_Swift
//
//  Created by Álvaro Fernandes on 06/01/20.
//  Copyright © 2020 Álvaro Fernandes. All rights reserved.
//
import Foundation

class HomeNewMovieProvider: RequestProvider {

    public var page: Int = 1
    
    var path: String {
        return "/3/movie/now_playing"
    }
    
    var httpVerb: HTTPMethod {
        return .get
    }
    
    var queryItems: [URLQueryItem] {
        return [URLQueryItem(name: "api_key", value: "760f4b73370f8305fcbb6952ed09618f"),
                URLQueryItem(name: "language", value: "pt-BR"),
                URLQueryItem(name: "page", value: "\(page)")]
    }
    
}
