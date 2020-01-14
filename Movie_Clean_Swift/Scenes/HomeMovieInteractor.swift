//
//  HomeMovieInteractor.swift
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

protocol HomeMovieBusinessLogic {
    func load(_ provider: RequestProvider)
    func getTypeTable() -> RequestProvider
    func cellForRow(at index: Int) -> HomeMovieModels.ViewModel?
    func filterMovies(_ name: String)
    func changeForPopular()
    func changeForNew()
    func selectItem(_ index: IndexPath)
    
    var numberOfRows: Int { get }
}

protocol HomeMovieDataStore {
    
}

class HomeMovieInteractor: HomeMovieBusinessLogic, HomeMovieDataStore {
    
    var presenter: HomeMoviePresentationLogic?
    var worker: HomeMovieWorker?
    var typeTable: MovieApi?
    
    var movies = [HomeMovieModels.Movie]()
    var filteredMovies: [HomeMovieModels.Movie] = []
    var moviesNew: [HomeMovieModels.Movie] = []
    
    let newProvider: HomeNewMovieProvider
    var popularProvider: HomePopularMovieProvider
    
    let textNil = ""
    
    init(worker: HomeMovieWorker = HomeMovieWorker()) {
        self.worker = worker
        self.newProvider = HomeNewMovieProvider()
        self.popularProvider = HomePopularMovieProvider()
    }
    
    var numberOfRows: Int {
       return movies.count
    }
    
    func cellForRow(at index: Int) -> HomeMovieModels.ViewModel? {
        guard index >= 0 && index < numberOfRows else { return nil }
        let movie = movies[index]
        return HomeMovieModels.ViewModel(movie: movie)
    }
    
    func selectItem(_ index: IndexPath) {
        presenter?.pushDetail(movies[index.row])
    }
    
    func load(_ provider: RequestProvider) {
        worker?.getMovies(provider).done(handleRequestSuccess).catch(handleRequestFailure)
    }
    
    func handleRequestSuccess(_ response: HomeMovieModels.MovieApiResponse) {
        self.moviesNew.append(contentsOf: response.movies)
        self.filteredMovies = moviesNew
        self.movies = moviesNew
        presenter?.reloadTableView()
    }
    
    func handleRequestFailure(_ error: Error) {
        presenter?.showError()
    }
    
    func filterMovies(_ searchText: String) {
        if searchText != textNil {
            movies = filteredMovies.filter { ($0.title.contains(searchText)) }
        } else {
            movies = filteredMovies
        }
        presenter?.reloadTableView()
    }

    func changeForNew() {
        self.moviesNew.removeAll()
        typeTable = MovieApi.newMovies
        load(newProvider)
    }
    
    func changeForPopular() {
        self.moviesNew.removeAll()
        typeTable = MovieApi.popular
        load(popularProvider)
    }
    
    func getTypeTable() -> RequestProvider {
        switch typeTable {
        case .newMovies:
            newProvider.page += 1
            return newProvider
        default:
            popularProvider.page += 1
            return popularProvider
        }
    }
    
}
