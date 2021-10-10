//
//  Breed.swift
//  DogApp
//
//  Created by Prateek Kumar on 05/10/21.
//

import Foundation


struct BreedInfo: Decodable {
    let response: Breed
}
struct BreedPhoto: Decodable {
    let status: String
        let message: String
}
struct Breed: Codable{
    
    let message: Dictionary<String,[String]>
    let status: String
    
}

