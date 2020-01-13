//
//  DetailRouter.swift
//  Movie_Clean_Swift
//
//  Created by Álvaro Fernandes on 12/01/20.
//  Copyright (c) 2020 Álvaro Fernandes. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol DetailRoutingLogic {
  
}

protocol DetailDataPassing {
    var dataStore: DetailDataStore? { get }
}

class DetailRouter: NSObject, DetailRoutingLogic, DetailDataPassing {
    
    weak var viewController: DetailViewController?
    var dataStore: DetailDataStore?
  
//    func routeToAny(){
//        guard let destinationVC = NextViewController() else { return }
//        var destinationDS = destinationVC.router!.dataStore!
//        passDataToSomewhere(source: dataStore!, destination: &destinationDS)
//        viewController?.navigationController?.pushViewController(destinationVC, animated: true)
//    }
//
//    func passDataToSomewhere(source: DetailDataStore, destination: inout NextDataStore) {
//      destination.session = source.session
//    }
}
