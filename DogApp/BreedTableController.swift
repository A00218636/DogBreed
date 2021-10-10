//
//  BreedTableController.swift
//  DogApp
//
//  Created by Prateek Kumar on 10/10/21.
//

import UIKit

class BreedTableController: UITableViewController {
    
    var breed: Breed!

    override func viewDidLoad() {
        super.viewDidLoad()

        DogAPIHelper.getBreeds(){
            breed -> Void in
            self.breed = breed
            self.tableView.reloadData()
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        if let breed = breed {
            return breed.message.count
        }
        else{
        return 0
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "breeds", for: indexPath)

       
        let breedinfo = Array(breed.message.keys)[indexPath.row]
        
        cell.textLabel?.text = breedinfo
        
        let subbreeds = breed.message[breedinfo]
        cell.detailTextLabel?.text = subbreeds?.joined(separator: "")

        return cell
    }
    

    

}

