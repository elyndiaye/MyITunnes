//
//  ApiClient.swift
//  iTunnes
//
//  Created by ely.assumpcao.ndiaye on 17/10/20.
//  Copyright © 2020 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class APIClient<T: Decodable> {

    let client: URLSession

    init(client: URLSession = URLSession.shared) {
        self.client = client
    }

    func fetchData(url: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(NetworkErrors.invalidData))
            return
        }
        execute(URL: url, completion: completion)
    }

    func execute(URL: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        client.dataTask(with: URL) { (data, response, error) in
            if let error = error {
                completion(.failure(RequestError.api(error: error)))
                return
            }

            guard let response = response as? HTTPURLResponse else {
                completion(.failure(NetworkErrors.unableToComplete))
                return
            }

            guard response.statusCode == 200 else {
                completion(.failure(NetworkErrors.invalidResponse))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkErrors.invalidData))
                return
            }

            completion(.success(data))
        }.resume()
    }
    
    // create a method for calling api which is return a Observable
    private let baseURL = URL(string: ConverterConstants.baseUrl.rawValue)!
    func send(apiRequest: APIRequest) -> Observable<T> {
       
        return Observable<T>.create { observer in
            let request = apiRequest.request(with: self.baseURL)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                do {
                    guard let data = data, data.count > 0 else { return }
                    let model: T = try JSONDecoder().decode(T.self, from: data )
                    observer.onNext( model)
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }

}


