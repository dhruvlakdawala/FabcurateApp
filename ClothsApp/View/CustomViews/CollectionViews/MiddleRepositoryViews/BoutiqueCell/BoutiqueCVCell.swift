//
//  BoutiqueCVCell.swift
//  ClothsApp
//
//  Created by Test on 16/02/24.
//

import UIKit

class BoutiqueCVCell: UICollectionViewCell {

    @IBOutlet weak var vwMainContainer: UIView!
    @IBOutlet weak var vwSubContainer: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCTA: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.initialSetup()
    }
    
    func initialSetup(){
        self.imgView.contentMode = .scaleAspectFill
    }
    
    func bindDataForBoutiqueCollection(objBoutique: BoutiqueCollection){
        self.imgView.downloaded(from: objBoutique.bannerImage)
        self.lblName.text = objBoutique.name
        self.lblCTA.text = objBoutique.cta
    }

}
