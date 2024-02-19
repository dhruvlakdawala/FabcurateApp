//
//  OccassionDesignTVCell.swift
//  ClothsApp
//
//  Created by Test on 17/02/24.
//

import UIKit

class OccassionDesignTVCell: UITableViewCell {

    @IBOutlet weak var cvOccassionDesign: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.inititalSetup()
    }
    
    func inititalSetup(){
        self.cvOccassionDesign.register(UINib(nibName: "OccassionDesignCVCell", bundle : nil), forCellWithReuseIdentifier: "OccassionDesignCVCell")
        self.cvOccassionDesign.tag = 7
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
