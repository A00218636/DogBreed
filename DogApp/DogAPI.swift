//
//  DogAPI.swift
//  DogApp
//
//  Created by Prateek Kumar on 05/10/21.
//

import Foundation

enum endPoint: String
{
    case Breeds = "https://dog.ceo/api/breeds/list/all"
    case randomBreedPhoto = "https://dog.ceo/api/breed/hound/images/random"
    
}
struct DogAPIHelper

{
   static var session:URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    static func getBreeds(completion: @escaping (Breed) -> Void)
    {
        let url = URL(string: endPoint.Breeds.rawValue)!
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request)
        {(data,respose,error) -> Void in
            
            if let data = data
            {
            do{
                let decoder = JSONDecoder()
                let breeds = try decoder.decode(Breed.self, from: data)
                
                OperationQueue.main.addOperation {
                    completion(breeds)
                }
                
                //print(breeds.message)
            }
            catch let error{
                print("error occured \(error)")
                
            }
            }
            
        }
        task.resume()
    }
    
    static func getRandomPhoto(breed: String ,completion: @escaping (String) -> Void){
        
        let url1:String = "https://dog.ceo/api/breed/"
        let url2:String = "/images/random"
        
        print(breed)
        let urlFinal:String = "\(url1)\(breed)\(url2)"
        
        print(urlFinal)
        
        let url = URL(string: urlFinal)!
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request)
        {(data,respose,error) -> Void in
            
            if let data = data
            {
            do{
                let decoder = JSONDecoder()
                let imageURL = try decoder.decode(BreedPhoto.self, from: data)
                
                OperationQueue.main.addOperation {
                    completion(imageURL.message)
                }
                
                print(imageURL.message)
            }
            catch let error{
                print("OOPS! There is an error. \(error)")
                
            }
            }
            
        }
        task.resume()
    }

}
