//
//  HomeMovieHeaderSnapshot.swift
//  Movie_Clean_SwiftTests
//
//  Created by Álvaro Fernandes on 11/01/20.
//  Copyright © 2020 Álvaro Fernandes. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import Alvão_Movies

class HomeMovieHeaderSnapshotTest: QuickSpec {
    
    override func spec() {
        
        describe("HomeMovieCell") {
            
            var view: HomeMovieHeader!
            
            beforeEach {
                view = HomeMovieHeader()
                view.translatesAutoresizingMaskIntoConstraints = false
            }
                
                it("should present light repository header view") {
//                    expect(view) == recordSnapshot()
                    expect(view) == snapshot()
                }
        }
    }
}


