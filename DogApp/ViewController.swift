//
//  ViewController.swift
//  DogApp
//
//  Created by Prateek Kumar on 05/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let session: URLSession = {
        let config = URLSessionConfiguration.default
        return  URLSession(configuration: config)
    }()
    
    //Declare Decodable variables and give them temporary values
    var breeds: Breed = Breed(message: ["Loading..."], status: "")
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let urlString = URL(string: "https://dog.ceo/api/breeds/list/all")
    
        let request = URLRequest(url: urlString!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        
        
        
        let task = session.dataTask(with: request){
            (data, response, error) -> Void in
            
            print("Starting data filtering")
            
            if let jsonData = data{
//                if let jsonString = String(data: jsonData, encoding: .utf8){
//                    print(jsonString)
                do{
                    let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String:Any]
                    
                    //Download dog breed names, then use names to download dog breed images
                    downloadJSON {
                        self.tableView.reloadData()
//                        self.downloadImage(){
//                            if (self.images[79] != nil) {
//                                self.tableView.reloadData()
//                            }
//                        }
                    }
                  
                    
                    func downloadJSON(completed: @escaping () -> ()) {
                        
                        let url = URL(string: "https://dog.ceo/api/breeds/list/all")
                        
                        URLSession.shared.dataTask(with: url!) {(jsonData, response, error) in
                            
                            if error == nil {
                                do {
                                    self.breeds = try JSONDecoder().decode(Breed.self, from: jsonData!)
                                    DispatchQueue.main.async {
                                        completed()
                                    }
                                } catch {
                                    print("JSON Error: Data")
                                }
                            }
                            }.resume()
                        
                    }
                    do {
                        if let dict = try JSONSerialization.jsonObject(with: jsonData) as? [String:Any] {


                            for (key, value) in dict {
                                print("\(key) -> \(value)")
                            }
                            //print(dict.values)
                        }
                    } catch {
                        print(error)
                    }
                    
                    let summary = try JSONDecoder().decode([String:Breeds].self, from: jsonData)
                   print(summary)
                    
                    
                    
                } catch let error {
                    print("Error creating json object: \(error)")
                }
            }else if let requestError = error{
                print("Error fetching data:\(requestError)")
            }
            else{
                print("Unexpected error with the request")
            }
            
        }
        
        task.resume()
    }
        
//        if let url = URL(string: urlString){
//            if let data = try?Data(contentsOf: url){
//                parse(json: data)
//
//            }
//        }
//
//        func parse(json: Data){
//            let decoder = JSONDecoder()
//
//            if let jsonBreeds = try? decoder.decode(Breeds.self, from: json){
//                breeds = jsonBreeds.result
//
//            }
//        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let breed = self.breeds.message[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "BreedCell") as! DogBreedCellTableViewCell
        //var imageURL = ""
//        if (self.images[78] != nil) {
//            imageURL = (self.images[indexPath.row]?.message)!
//        }
        //cell.setCellStyle();
        cell.setBreed(breed: breed)
        return cell
        
    }
    
    
}
    

    




