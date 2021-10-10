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
//    override func awakeFromNib() {
//        super.awakeFromNib()
//       
//    }


      
      /*
       Function to set the label and image in UITableView cells
       */
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
