//
//  CategoryTVCell.swift
//  ClothsApp
//
//  Created by Test on 16/02/24.
//

import UIKit

class CategoryTVCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var vwMain: UIView!
    @IBOutlet weak var vwContainer: CardView!
    @IBOutlet weak var vwCategory: UIView!
    @IBOutlet weak var lblCatgoryName: UILabel!
    @IBOutlet weak var svSubCategory: UIStackView!
    @IBOutlet weak var tblSubCatgory: UITableView!
    @IBOutlet weak var btnUpDown: UIButton!
    @IBOutlet weak var nslcSubTableHeight: NSLayoutConstraint!
    
    var arrSubCatgories: [Category]?
    
    var isExpand = false
    
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
        
        self.svSubCategory.layer.cornerRadius = 10
        self.svSubCategory.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        self.svSubCategory.layer.masksToBounds = true
        
        self.tblSubCatgory.layer.cornerRadius = 10
        self.tblSubCatgory.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        self.tblSubCatgory.layer.masksToBounds = true
        
//        self.svSubCategory.isHidden = true
        
        self.tblSubCatgory.delegate = self
        self.tblSubCatgory.dataSource = self
        
        // table nib register
        self.tblSubCatgory.register(UINib(nibName: "SubCategoryTVCell", bundle : nil), forCellReuseIdentifier: "SubCategoryTVCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrSubCatgories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SubCategoryTVCell", for: indexPath) as? SubCategoryTVCell {
            cell.lblSubCategoryName.text = self.arrSubCatgories?[indexPath.row].categoryName
            return cell
        }
        return UITableViewCell()
    }
}
