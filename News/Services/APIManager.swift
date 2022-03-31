//
//  APIManager.swift
//  News
//
//  Created by k u r i s u on 3/31/22.
//

import Foundation
protocol APIManager {
    func getArticles(completion: @escaping (Swift.Result<Results, Error>) -> Void)
}

struct APIMan {
    
    static let API_Key = "AcGVhNNBKV4Twd4unupQE7TO9IEjSR8D"
    static let section = "all-sections"
    static let time = "7"
    static let URLString = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/\(section)/\(time).json?api-key=\(API_Key)"
    
    private init() {    }
    static var shared = APIMan()
    
    private func performRequest(with URLString: String, completion: @escaping (Swift.Result<Results, Error>) -> Void) {
        if let url = URL(string: URLString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {data, response, error in
                
                if let error = error {
                    completion(.failure(error))
                }
                
                if let data = data {
                    if let results = self.parseJson(data) {
                        completion(.success(results))
                    }
                }
            }
            task.resume()
        }
    }
    
    private func parseJson(_ data: Data) -> Results? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(Results.self, from: data)
            let results = decodedData
            return results
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    
}


extension APIMan : APIManager {
    
    func getArticles(completion: @escaping (Swift.Result<Results, Error>) -> Void) {
        performRequest(with: APIMan.URLString){ result in
            completion(result)
        }
    }
}
