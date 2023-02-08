//
//  Fetcher.swift
//  MarvelCharacters
//
//  Created by Andrés A. on 5/15/22.
//  Copyright © 2022 Andrés A.. All rights reserved.
//

import UIKit

enum DataError: Error {
    case invalidResponse
    case invalidData
    case decodingError
    case serverError
}

typealias result<T> = (Result<[T], Error>) -> Void
typealias FetchResultCallback<T> = (Result<T, Error>) -> Void
typealias FetchResult<T> = Result<T, Error>


class Fetcher {
    let imageCache = NSCache<NSString, UIImage>()
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func fetchJSON<T: Decodable>(of type: T.Type, from url: URL, completion: @escaping FetchResultCallback<T>) {
        self.session.dataTaskWithUrl(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(DataError.invalidResponse))
                return
            }
            
            if 200...299 ~= response.statusCode || response.statusCode == 304 {
                self.decodeJson(data: data, completion: completion)
            } else {
                completion(.failure(DataError.serverError))
            }
        }.resume()
    }
    
    func decodeJson<T: Decodable>(data: Data?, completion: @escaping FetchResultCallback<T>) {
        if let data = data {
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedData:T = try jsonDecoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                print(error)
                completion(.failure(DataError.decodingError))
            }
        } else {
            completion(.failure(DataError.invalidData))
        }
    }
    
    func fetchImage(from urlString: String, completion: @escaping FetchResultCallback<UIImage>) {
        guard let url = URL(string: urlString) else {
            print("Error: Cannot create URL from string")
            return
        }
        return self.fetchImage(from: url, completion: completion)
    }
    

    func fetchImage(from url:URL, completion: @escaping FetchResultCallback<UIImage>) {
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            completion(.success(cachedImage))
        } else {
            let dataTask = self.session.dataTaskWithUrl(with: url) { [weak self] (data, response, error) in
                guard let self = self else {
                    print("No self Fetcher reference found")
                    return
                }
                if error != nil {
                    print("Error fetching the data from server!")
                    completion(.failure(error!))
                } else {
                    if let data = data, let image = UIImage(data: data) {
                        self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                        completion(.success(image))
                    } else {
                        completion(.failure(error!))
                    }
                    
                }
                
            }
            dataTask.resume()
        }
    }
    
}
