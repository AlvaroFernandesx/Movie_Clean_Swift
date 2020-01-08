//
//  NetworkCases.swift
//  Movie_Clean_Swift
//
//  Created by Álvaro Fernandes on 30/12/19.
//  Copyright © 2019 Álvaro Fernandes. All rights reserved.
//

import Foundation

enum NetworkResponse: Error {
    case success
    case authenticationError
    case badRequest 
    case outdated 
    case failed 
    case noData 
    case unableToDecode 
}


