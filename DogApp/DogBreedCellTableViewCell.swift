//
//  DogBreedCellTableViewCell.swift
//  DogApp
//
//  Created by Prateek Kumar on 05/10/21.
//

import UIKit

class DogBreedCellTableViewCell: UITableViewCell {

  
    
    @IBOutlet weak var BreedLabel: UILabel!
    /*
       Function to round the corners of the dog breed images
       */

      
      /*
       Function to set the label and image in UITableView cells
       */
      //func setBreed(breed: String, imageURL: String) {
        func setBreed(breed: String) {
            BreedLabel.text = breed
         
      }
    
}
