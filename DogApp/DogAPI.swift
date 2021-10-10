//
//  DogAPI.swift
//  DogApp
//
//  Created by Prateek Kumar on 05/10/21.
//

import Foundation


struct DogAPI {
    private static var baseURL = URL(string: "https://dog.ceo/api/breeds/image/random")
    
    private static let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    static func fetchBreeds(completion: @escaping (String) -> Void){
        guard let url = baseURL else {
            preconditionFailure("baseURL was nil")
        }
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request){
            (data, response, error) -> Void in
            
            if let jsonData = data {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
                    
                    print(jsonObject)
                    
                    guard
                        let jsonDiction = jsonObject as? [AnyHashable:Any],
                        let message = jsonDiction["message"] as? String
                    else { preconditionFailure("error: cannot process json informaiton")}
                    
                    completion(message)
                } catch let error {
                    preconditionFailure("error: \(error)")
                }
            }
        }
        task.resume()
    }
}
