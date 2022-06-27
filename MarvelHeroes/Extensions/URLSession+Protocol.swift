////
////  URLSession+Protocol.swift
////  Marvel Characters
////  This allows to mock URLSession for Unit Testing
//
////  Created by Andres Acevedo on 25/01/22.
////  Copyright © 2022 Andrés A. All rights reserved.
////

import Foundation

protocol URLSessionProtocol {
    func dataTaskWithUrl(with url: URL, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol
}
typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void

extension URLSession: URLSessionProtocol {
    func dataTaskWithUrl(with url: URL, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        self.dataTask(with: url, completionHandler: completionHandler)
    }
}


protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol { }

