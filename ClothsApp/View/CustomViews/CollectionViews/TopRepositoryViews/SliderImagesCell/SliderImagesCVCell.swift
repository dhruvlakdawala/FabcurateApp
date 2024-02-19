//
//  SliderImagesCVCell.swift
//  ClothsApp
//
//  Created by Test on 16/02/24.
//

import UIKit

class SliderImagesCVCell: UICollectionViewCell {

    @IBOutlet weak var vwMainContainer: UIView!
    @IBOutlet weak var vwBottomContainer: UIView!
    @IBOutlet weak var vwMiddleContainer: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblCTA: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.initialSetup()
    }
    
    func initialSetup(){
        self.vwMainContainer.layer.cornerRadius = 5
        self.vwMainContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.vwMainContainer.layer.masksToBounds = true
        self.imgView.contentMode = .scaleAspectFill
    }
    
    func bindDataForSliderCell(objMainStickyData: MainStickyMenu){
        self.lblTitle.text = objMainStickyData.title
        self.imgView.downloaded(from: objMainStickyData.image)
        self.lblCTA.text = objMainStickyData.cta
    }

}
