//
//  SliderImageTVCell.swift
//  ClothsApp
//
//  Created by Test on 17/02/24.
//

import UIKit

class SliderImageTVCell: UITableViewCell {

    @IBOutlet weak var cvSliderImages: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.inititalSetup()
    }
    
    func inititalSetup(){
        self.cvSliderImages.register(UINib(nibName: "SliderImagesCVCell", bundle : nil), forCellWithReuseIdentifier: "SliderImagesCVCell")
        self.cvSliderImages.tag = 1
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
