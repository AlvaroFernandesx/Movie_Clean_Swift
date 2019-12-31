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
            URLSession.shared.dataTask(with: request.asURLRequest) { (data, response, _) in
                let statusCode = self.handleNetworkResponse((response as? HTTPURLResponse)?.statusCode ?? 0)
                switch statusCode {
                case .success:
                    let data = data ?? Data()
                    do {
                        let model = try JSONDecoder().decode(T.self, from: data)
                        seal.fulfill(model)
                        print(model)
                    } catch {
                        seal.reject(error)
                    }
                case .failure(_):
                    seal.reject(NSError(domain: "\(statusCode)", code: 0, userInfo: nil))
                }
            }.resume()
        }
    }
    
    fileprivate func handleNetworkResponse(_ response: Int) -> Result<String> {
        switch response {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
    
}
