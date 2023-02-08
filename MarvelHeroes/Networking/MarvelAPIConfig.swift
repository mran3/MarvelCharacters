//
//  APIConfig.swift
//  MarvelCharacters
//
//  Created by troquer on 7/18/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import Foundation

struct Environment {
    static let baseURL = "gateway.marvel.com"
}

final class APIConfig {
    
    static let host = Environment.baseURL
    static let scheme = "https"
    
    static var baseURL: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        return urlComponents
    }
}

extension URLComponents {
    mutating func setQueryItems<T: LosslessStringConvertible>(with parameters: [String: T]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: String($0.value)) }
    }
}

enum MarvelTarget: Target {
    case listCharacters
    case characterDetails(id: Int)
    
    var path: String {
        switch self {
        case .listCharacters:
            return "/v1/public/characters"
        case let .characterDetails(id):
            return "detail/\(id)/"
        }
    }
    
    func makeURL(parameters: [String: String] = [:]) -> URL? {
        var mutableParameters = parameters
        var urlComponents = APIConfig.baseURL
        urlComponents.path = self.path
        addKey(parameters: &mutableParameters)
        urlComponents.setQueryItems(with: mutableParameters)
        guard let url = urlComponents.url else {
            print("Error creating url")
            return nil
        }
        return url
    }
    
    //As this is an example project we are using a static hash here.
    //In a real world app, more complex logic using private key
    //and timestamp can be used.
    func addKey(parameters: inout [String: String]) {
        parameters["ts"] = "1234"
        parameters["hash"] = "80dac65a1a0bc0cd23fc6d2e481f892a"
        parameters["apikey"] = "62252a46c2fab975fa19384bf3d86da9" // In a real world application, this won't be on version control system.
    }
    
}



