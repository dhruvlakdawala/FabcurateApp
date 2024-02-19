//
//  CategoryCVCell.swift
//  ClothsApp
//
//  Created by Test on 16/02/24.
//

import UIKit

class CategoryCVCell: UICollectionViewCell {

    @IBOutlet weak var vwMainContainer: UIView!
    @IBOutlet weak var vwBottomContainer: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblCTA: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.initialSetup()
    }
    
    func initialSetup(){
        self.imgView.contentMode = .scaleAspectFill
    }
    
    func bindDataForCategory(objCategory: ShopBy){
//        print("HexaCode ==> \(objCategory.tintColor)")
        self.vwBottomContainer.backgroundColor = UIColor(hex: "#\(objCategory.tintColor)")
        self.imgView.downloaded(from: objCategory.image)
        self.lblTitle.text = objCategory.name
    }
}
