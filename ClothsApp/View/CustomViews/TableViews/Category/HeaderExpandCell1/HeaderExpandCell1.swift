//
//  HeaderExpandCell1.swift
//  ClothsApp
//
//  Created by Test on 19/02/24.
//

import UIKit

class HeaderExpandCell1: UITableViewCell {

    @IBOutlet weak var vwMain: UIView!
    @IBOutlet weak var vwContainer: UIView!
    @IBOutlet weak var vwCategory: UIView!
    @IBOutlet weak var lblCatgoryName: UILabel!
    @IBOutlet weak var btnUpDown: UIButton!
    @IBOutlet weak var vwCategoryName: CardView!
    @IBOutlet weak var vwTrailingImage: UIView!
    @IBOutlet weak var imgCategoryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.initialSetup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initialSetup(){
//        self.vwContainer.layer.cornerRadius = 10
//        self.vwContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
//        self.vwContainer.layer.masksToBounds = true
        
        self.vwCategoryName.layer.cornerRadius = 35
        self.vwCategoryName.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        self.vwCategoryName.layer.masksToBounds = true
    }
    
}
