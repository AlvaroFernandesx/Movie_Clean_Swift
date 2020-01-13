//
//  HomeMovieModels.swift
//  Movie_Clean_Swift
//
//  Created by Álvaro Fernandes on 30/12/19.
//  Copyright (c) 2019 Álvaro Fernandes. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class HomeMovieModels {
 
    struct MovieApiResponse: Decodable {

        let movies: [Movie]

        private enum MovieApiResponseCodingKeys: String, CodingKey {
            case movies = "results"
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: MovieApiResponseCodingKeys.self)
            movies = try container.decode([Movie].self, forKey: .movies)
           
        }
        
        init(_ movies: [Movie]) {
            self.movies = movies
        }
    }

    struct Movie: Decodable {
        let id: Int
        let posterPath: String
        let backdrop: String
        let title: String
        let overview: String
        
        enum MovieCodingKeys: String, CodingKey {
            case id
            case posterPath = "poster_path"
            case backdrop = "backdrop_path"
            case title
            case overview
        }
        

        init(from decoder: Decoder) throws {
            let movieContainer = try decoder.container(keyedBy: MovieCodingKeys.self)

            id = try movieContainer.decode(Int.self, forKey: .id)
            posterPath = try movieContainer.decode(String.self, forKey: .posterPath)
            backdrop = try movieContainer.decode(String.self, forKey: .backdrop)
            title = try movieContainer.decode(String.self, forKey: .title)
            overview = try movieContainer.decode(String.self, forKey: .overview)
        }
        
        init(_ id: Int,_ posterPath: String,_ backdrop: String,_ title: String,_ overview: String) {
            self.id = id
            self.posterPath = posterPath
            self.backdrop = backdrop
            self.title = title
            self.overview = overview
        }
    }
    
    struct ViewModel: Decodable {
        let id: Int
        let posterPath: String
        let backdrop: String
        let title: String
        let overview: String
        
        init(movie: Movie) {
            self.id = movie.id
            self.posterPath = "https://image.tmdb.org/t/p/w200/\(movie.posterPath)"
            self.backdrop = "https://image.tmdb.org/t/p/w200/\(movie.backdrop)"
            self.title = movie.title
            self.overview = movie.overview
        }
    }
}

class Models {
    struct MovieAPIResponse: Decodable {
        
        let movies: [Result]?
        let page, totalResults: Int?
        let dates: Dates?
        let totalPages: Int?
        
        private enum MovieApiResponseCodingKeys: String, CodingKey {
            case movies = "results"
        }
        
    }

    struct Dates: Decodable {
        let maximum, minimum: String
    }

    struct Result: Decodable {
        let popularity: Double
        let voteCount: Int
        let video: Bool
        let posterPath: String
        let id: Int
        let adult: Bool
        let backdropPath: String?
        let originalLanguage, originalTitle: String
        let genreIDS: [Int]
        let title: String
        let voteAverage: Double
        let overview, releaseDate: String
    }
}
