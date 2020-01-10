//
//  Movie_Clean_SwiftTests.swift
//  Movie_Clean_SwiftTests
//
//  Created by Álvaro Fernandes on 29/12/19.
//  Copyright © 2019 Álvaro Fernandes. All rights reserved.
//

import Quick
import Nimble
import PromiseKit

@testable import Alvão_Movies

class Movie_Clean_SwiftTests: QuickSpec {
    
    class DummyHomePresenter: HomeMoviePresentationLogic {
                
        var hasCalledReloadCollection = false
        var hasCalledError = false
        
        func reloadTableView() { hasCalledReloadCollection = true }
        func showError() { hasCalledError = true }
        
    }
    
    class MockWorker: HomeMovieWorker {
        var isSucesss = true
        
        override func getMovies(_ request: RequestProvider) -> Promise<HomeMovieModels.MovieApiResponse> {
            
            if isSucesss {
                let movie1 = HomeMovieModels.Movie(001, "", "", "HOMEM DE FERRO", "DA UM SONO")
                let movie2 = HomeMovieModels.Movie(001, "", "", "HOMEM DE FERRO", "DA UM SONO")
                let movie3 = HomeMovieModels.Movie(001, "", "", "HARRY POTTER", "DA UM SONO")
                let movies = [movie1, movie2, movie3]
                let response = HomeMovieModels.MovieApiResponse(movies)
                
                return Promise {seal in
                    seal.fulfill(response)
                }
            } else {
                let error: Error = NSError(domain: "", code: 404, userInfo: nil)
                return Promise {seal in
                    seal.reject(error)
                }
            }
        }
    }
    
    var subject: HomeMovieInteractor!
    var dummyHomePresenter: DummyHomePresenter!
    var mockWorker = MockWorker()
    var provider = HomePopularMovieProvider()
    var newProvider = HomeNewMovieProvider()
    var mockTypeTable: MovieApi = MovieApi.newMovies
    
    override func spec() {
        super.spec()
        
        beforeEach {
            let interactor = HomeMovieInteractor(worker: self.mockWorker)
            self.dummyHomePresenter = DummyHomePresenter()
            interactor.presenter = self.dummyHomePresenter
            self.subject = interactor
        }
        
        describe("#load") {
            context("when is success") {
                it("returns a movie list") {
                    self.mockWorker.isSucesss = true
                    self.subject.handleRequestSuccess(self.mockWorker.getMovies(self.provider).value!)
                    expect(self.dummyHomePresenter.hasCalledReloadCollection).to(beTrue())
                }
            }
            context("when is failed") {
                it("show error pop up") {
                    self.mockWorker.isSucesss = false
                    self.subject.handleRequestFailure(self.mockWorker.getMovies(self.provider).error!)
                    expect(self.dummyHomePresenter.hasCalledError).to(beTrue())
                }
            }
        }

        describe("#numberOfRows") {
            context("when there is no return") {
                it("returns 0 because the list is empty") {
                    expect(self.subject.numberOfRows).to(equal(0))
                }
            }
            context("when the list has movies") {
                it("returns 3 because the list has an answer") {
                    self.mockWorker.isSucesss = true
                    let response: HomeMovieModels.MovieApiResponse = self.mockWorker.getMovies(self.provider).value!
                    self.subject.movies = response.movies
                    expect(self.subject.numberOfRows).to(equal(3))
                }
            }
        }
        
        describe("#cellForRow") {
            context("when there is no return") {
                it("returns 0 because the list is empty") {
                    expect(self.subject.cellForRow(at: 0)).to(beNil())
                }
            }
            context("when the list has movies") {
                it("returns the id of the first movie") {
                    let response: HomeMovieModels.MovieApiResponse = self.mockWorker.getMovies(self.provider).value!
                    self.subject.movies = response.movies
                    expect(self.subject.cellForRow(at: 0)?.id).to(equal(001))
                }
            }
        }
        
        describe("#changeForPopular") {
            context("when table data is changed to popular") {
                it("table type must be popular") {
                    self.subject.changeForPopular()
                    expect(self.subject.typeTable).to(equal(MovieApi.popular))
                }
            }
        }
        
        describe("#changeForNew") {
            context("when table data is changed to new") {
                it("table type must be new") {
                    self.subject.changeForNew()
                    expect(self.subject.typeTable).to(equal(MovieApi.newMovies))
                }
            }
        }
        
        describe("#getTypeTable") {
            context("when the table footer wants to take the table type and go to the next page") {
                it("return table of new type on page 2") {
                    self.subject.newProvider.page = 1
                    self.subject.typeTable = MovieApi.newMovies
                    self.subject.getTypeTable()
                    expect(self.subject.newProvider.page).to(equal(2))
                }
            }
            context("when the table footer wants to take the table type and go to the next page") {
                it("return table of popular type on page 2") {
                    self.subject.popularProvider.page = 1
                    self.subject.typeTable = MovieApi.popular
                    self.subject.getTypeTable()
                    expect(self.subject.popularProvider.page).to(equal(2))
                }
            }
        }
        
        describe("#filterMovies") {
            context("when the filter is empty") {
                it("returns to table or same number of movies") {
                    self.mockWorker.isSucesss = true
                    let response: HomeMovieModels.MovieApiResponse = self.mockWorker.getMovies(self.provider).value!
                    self.subject.movies = response.movies
                    self.subject.filterMovies("")
                    expect(self.subject.filteredMovies.count).to(equal(self.subject.movies.count))
                }
            }
            context("when the filter is FERRO") {
                it("returns to table 2 movies") {
                    self.mockWorker.isSucesss = true
                    let response: HomeMovieModels.MovieApiResponse = self.mockWorker.getMovies(self.provider).value!
                    self.subject.filteredMovies = response.movies
                    self.subject.filterMovies("HOMEM")
                    expect(self.dummyHomePresenter.hasCalledReloadCollection).to(beTrue())
                    expect(self.subject.movies.count).to(equal(2))
                }
            }
        }
    }
}
