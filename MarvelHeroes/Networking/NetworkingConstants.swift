//
//  Environment.swift
//  MarvelCharacters
//
//  Created by Andres Acevedo on 14/07/14.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import Foundation

enum RESTMethod: String {
    case get = "get"
    case post = "post"
}

enum ServiceError: Error {
    case getError(String)
}

protocol Target {
    var path: String {get}
}
