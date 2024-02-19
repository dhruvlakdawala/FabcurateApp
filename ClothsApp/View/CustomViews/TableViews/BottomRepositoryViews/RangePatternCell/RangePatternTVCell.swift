//
//  RangePatternTVCell.swift
//  ClothsApp
//
//  Created by Test on 17/02/24.
//

import UIKit

class RangePatternTVCell: UITableViewCell {

    @IBOutlet weak var cvRangePattern: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.inititalSetup()
    }
    
    func inititalSetup(){
        self.cvRangePattern.register(UINib(nibName: "FabricAndRangePatternCVCell", bundle : nil), forCellWithReuseIdentifier: "FabricAndRangePatternCVCell")
        self.cvRangePattern.tag = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
