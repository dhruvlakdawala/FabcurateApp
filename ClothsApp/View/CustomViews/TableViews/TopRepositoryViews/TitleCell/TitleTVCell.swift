//
//  TitleTVCell.swift
//  ClothsApp
//
//  Created by Test on 17/02/24.
//

import UIKit

class TitleTVCell: UITableViewCell {

    @IBOutlet weak var cvTitles: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.inititalSetup()
    }
    
    func inititalSetup(){
        self.cvTitles.register(UINib(nibName: "TitleCVCell", bundle : Bundle.main), forCellWithReuseIdentifier: "TitleCVCell")
        self.cvTitles.tag = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
