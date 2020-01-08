//
//  HomeMovieProvider.swift
//  Movie_Clean_Swift
//
//  Created by Álvaro Fernandes on 30/12/19.
//  Copyright © 2019 Álvaro Fernandes. All rights reserved.
//

import Foundation

class HomePopularMovieProvider: RequestProvider {

    public var page: Int = 2
    
    var path: String {
        return "/3/movie/popular"
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
