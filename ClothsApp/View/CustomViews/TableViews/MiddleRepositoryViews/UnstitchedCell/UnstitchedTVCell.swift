//
//  UnstitchedTVCell.swift
//  ClothsApp
//
//  Created by Test on 17/02/24.
//

import UIKit

class UnstitchedTVCell: UITableViewCell {

    @IBOutlet weak var cvUnstitched: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.inititalSetup()
    }
    
    func inititalSetup(){
        self.cvUnstitched.register(UINib(nibName: "UnstitchedCVCell", bundle : nil), forCellWithReuseIdentifier: "UnstitchedCVCell")
        self.cvUnstitched.tag = 6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
