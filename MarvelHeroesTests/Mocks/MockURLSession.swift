//
//  MockURLSession.swift
//  Marvel Characters UnitTests
//
//  Created by Andres Acevedo on 25/01/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import Foundation
@testable import MarvelHeroes

class MockURLSession: URLSessionProtocol {
    var lastURL: URL?
    var nextDataTask: MockURLSessionDataTask!
    
    func dataTaskWithUrl(with url: URL, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        lastURL = url
        nextDataTask = MockURLSessionDataTask()
        return nextDataTask
    }
    
}

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    var resumeWasCalled = false
    
    func resume() {
        resumeWasCalled = true
    }
}
