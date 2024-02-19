//
//  HeaderCell.swift
//  ClothsApp
//
//  Created by Test on 19/02/24.
//

import UIKit

class HeaderExpandCell: UITableViewCell {

    @IBOutlet weak var vwMain: UIView!
    @IBOutlet weak var vwContainer: UIView!
    @IBOutlet weak var vwCategory: UIView!
    @IBOutlet weak var lblCatgoryName: UILabel!
    @IBOutlet weak var btnUpDown: UIButton!
    
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
        self.vwContainer.layer.cornerRadius = 10
        self.vwContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        self.vwContainer.layer.masksToBounds = true
        
        self.vwCategory.layer.cornerRadius = 10
        self.vwCategory.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        self.vwCategory.layer.masksToBounds = true
    }
    
}
