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
        
        describe("#HomeMovieCell") {
            
            var dummyViewController: HomeMovieCell!
            
            beforeEach {
                dummyViewController = HomeMovieCell()
                dummyViewController.translatesAutoresizingMaskIntoConstraints = false
                dummyViewController.setup()
                
                it("should present light repository header view") {
                    expect(dummyViewController) == recordSnapshot()
                }
                
//                it("button search as clicked") {
//                    dummyViewController.showSearchBar()
//                    expect(dummyViewController) == snapshot()
//                }
                
            }
        }
    }
}

