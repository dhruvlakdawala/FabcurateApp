//
//  UnstitchedCVCell.swift
//  ClothsApp
//
//  Created by Test on 16/02/24.
//

import UIKit

class UnstitchedCVCell: UICollectionViewCell {

    @IBOutlet weak var vwMainContainer: UIView!
    @IBOutlet weak var vwSubContainer: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.initialSetup()
    }
    
    func initialSetup(){
        self.imgView.contentMode = .scaleAspectFill
    }
    
    func bindDataForUnstitched(objUnstitched: Unstitched){
        self.imgView.downloaded(from: objUnstitched.image)
        self.lblName.text = objUnstitched.name
        self.lblDescription.text = objUnstitched.description
    }

}
