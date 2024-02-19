//
//  OccassionDesignCVCell.swift
//  ClothsApp
//
//  Created by Test on 16/02/24.
//

import UIKit

class OccassionDesignCVCell: UICollectionViewCell {

    @IBOutlet weak var vwMainContainer: UIView!
    @IBOutlet weak var vwSubContainer: UIView!
    @IBOutlet weak var vwBottomContainer: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSubName: UILabel!
    @IBOutlet weak var lblCTA: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.initialSetup()
    }
    
    func initialSetup(){
        self.imgView.contentMode = .scaleAspectFill
        self.vwBottomContainer.backgroundColor = UIColor(white: 1, alpha: 0.5)
    }
    
    func bindDataForOccassionDesign(objOccassionDesign: DesignOccasion){
        self.imgView.downloaded(from: objOccassionDesign.image)
        self.lblName.text = objOccassionDesign.name
        self.lblSubName.text = objOccassionDesign.subName
        self.lblCTA.text = objOccassionDesign.cta
    }
}
