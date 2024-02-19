//
//  CategoryCell.swift
//  ClothsApp
//
//  Created by Test on 17/02/24.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var cvCategory: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.inititalSetup()
    }
    
    func inititalSetup(){
        self.cvCategory.register(UINib(nibName: "CategoryCVCell", bundle : nil), forCellWithReuseIdentifier: "CategoryCVCell")
        self.cvCategory.tag = 2

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
