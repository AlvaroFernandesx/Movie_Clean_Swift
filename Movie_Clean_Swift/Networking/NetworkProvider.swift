//
//  NetworkProvider.swift
//  Movie_Clean_Swift
//
//  Created by Álvaro Fernandes on 30/12/19.
//  Copyright © 2019 Álvaro Fernandes. All rights reserved.
//

import Foundation
import PromiseKit

class NetworkProvider {
    
    func execute<T: Decodable>(request: RequestProvider, parser: T.Type) -> Promise<T> {
        return Promise<T> { seal in
            print(request.asURLRequest)
            URLSession.shared.dataTask(with: request.asURLRequest) { (data, response, _) in
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
                switch statusCode {
                case 200...299:
                    let data = data ?? Data()
                    do {
                        let model = try JSONDecoder().decode(T.self, from: data)
                        seal.fulfill(model)
                    } catch {
                        print(statusCode)
                        seal.reject(NetworkResponse.unableToDecode)
                    }
                default :
                    seal.reject(self.handleNetworkResponse(statusCode))
                }
            }.resume()
        }
    }
    
    fileprivate func handleNetworkResponse(_ response: Int) -> NetworkResponse {
        switch response {
        case 401...500: return NetworkResponse.authenticationError
        case 501...599: return NetworkResponse.badRequest
        case 600: return NetworkResponse.outdated
        default: return NetworkResponse.failed
        }
    }
    
}
