//
//  FabricAndRangePatternCVCell.swift
//  ClothsApp
//
//  Created by Test on 16/02/24.
//

import UIKit

class FabricAndRangePatternCVCell: UICollectionViewCell {
    
    @IBOutlet weak var vwMainContainer: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        self.vwMainContainer.layer.cornerRadius = self.vwMainContainer.layer.bounds.height / 2
        self.vwMainContainer.layer.masksToBounds = true
        self.vwMainContainer.clipsToBounds = true
        self.imgView.layer.cornerRadius = self.imgView.layer.bounds.height / 2
        self.imgView.layer.masksToBounds = true
        self.imgView.clipsToBounds = true
    }
    
    func bindDataForFabric(objFabric: ShopBy){
        self.imgView.downloaded(from: objFabric.image)
        self.lblTitle.text = objFabric.name
    }
    
    func bindDataForRangeOfPattern(objRangePattern: RangeOfPattern){
        self.imgView.downloaded(from: objRangePattern.image)
        self.lblTitle.text = objRangePattern.name
    }

}
