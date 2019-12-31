//
//  HomeMovieProvider.swift
//  Movie_Clean_Swift
//
//  Created by Álvaro Fernandes on 30/12/19.
//  Copyright © 2019 Álvaro Fernandes. All rights reserved.
//

import Foundation

class HomeMovieProvider: RequestProvider {

    var movieApi: MovieApi
    var page: Int
    
    var path: String {
        switch movieApi {
        case .popular:
            return "/3/movie/popular"
        case .newMovies:
            return "/3/movie/now_playing"
        }
    }
    

    var httpVerb: HTTPMethod {
        return .get
    }
    
    var queryItems: [URLQueryItem] {
        return [URLQueryItem(name: "api_key", value: "760f4b73370f8305fcbb6952ed09618f"),
                URLQueryItem(name: "language", value: "pt-BR"),
                URLQueryItem(name: "page", value: "\(page)")]
    }
    
    init(movieApi: MovieApi, page: Int) {
        self.movieApi = movieApi
        print(movieApi)
        self.page = page
    }
    
}
