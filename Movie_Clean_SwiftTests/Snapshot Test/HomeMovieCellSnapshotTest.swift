//
//  SnapshotTests.swift
//  Movie_Clean_SwiftTests
//
//  Created by Álvaro Fernandes on 09/01/20.
//  Copyright © 2020 Álvaro Fernandes. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import Alvão_Movies

class HomeMovieCellSnapshotTest: QuickSpec {
    
    override func spec() {
        
        describe("HomeMovieCell") {
            
            var view: HomeMovieCell!
            
            beforeEach {
                view = HomeMovieCell()
                view.translatesAutoresizingMaskIntoConstraints = false
            }
                
                it("should present light repository cell view") {
//                    expect(view) == recordSnapshot()
                    expect(view) == snapshot()
                }
        }
    }
}

