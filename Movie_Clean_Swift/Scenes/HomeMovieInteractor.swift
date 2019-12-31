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
  func load()
}

protocol HomeMovieDataStore {
  //var name: String { get set }
}

class HomeMovieInteractor: HomeMovieBusinessLogic, HomeMovieDataStore {
    
    var presenter: HomeMoviePresentationLogic?
    var worker: HomeMovieWorker?
    
    init(worker: HomeMovieWorker = HomeMovieWorker()) {
      self.worker = worker
    }
    
    func load() {
        worker?.getData(movieApi: MovieApi.newMovies, page: 1)
    }

    
}
