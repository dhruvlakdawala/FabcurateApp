//
//  HeaderCell.swift
//  ClothsApp
//
//  Created by Test on 17/02/24.
//

import UIKit

class HeaderCell: UITableViewHeaderFooterView {

    // MARK:- IBOutlets
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var vwContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.initialSetup()
    }
    
    func initialSetup(){
        self.vwContainerView.backgroundColor = UIColor.white
        self.lblTitle.textColor = UIColor.darkGray
    }
}
