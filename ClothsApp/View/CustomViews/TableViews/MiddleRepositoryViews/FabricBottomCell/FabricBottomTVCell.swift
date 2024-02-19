//
//  FabricBottomTVCell.swift
//  ClothsApp
//
//  Created by Test on 17/02/24.
//

import UIKit

class FabricBottomTVCell: UITableViewCell {

    @IBOutlet weak var cvFabrics: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.inititalSetup()
    }
    
    func inititalSetup(){
        self.cvFabrics.register(UINib(nibName: "FabricAndRangePatternCVCell", bundle : nil), forCellWithReuseIdentifier: "FabricAndRangePatternCVCell")
        self.cvFabrics.tag = 5

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
