//
//  OccassionDesignTVCell.swift
//  ClothsApp
//
//  Created by Test on 17/02/24.
//

import UIKit

class OccassionDesignTVCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var cvOccassionDesign: UICollectionView!
    
    var objBottomRepository: BottomRepository?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.inititalSetup()
    }
    
    func inititalSetup(){
        self.cvOccassionDesign.register(UINib(nibName: "OccassionDesignCVCell", bundle : nil), forCellWithReuseIdentifier: "OccassionDesignCVCell")
        self.cvOccassionDesign.tag = 10
        self.cvOccassionDesign.dataSource = self
        self.cvOccassionDesign.delegate = self
        self.cvOccassionDesign.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.objBottomRepository?.designOccasion.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OccassionDesignCVCell", for: indexPath) as! OccassionDesignCVCell
        if let objOccassionDesign = self.objBottomRepository?.designOccasion[indexPath.row] {
            cell.bindDataForOccassionDesign(objOccassionDesign: objOccassionDesign)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var columns: CGFloat
        
        let orientation = UIApplication.shared.windows.first?.windowScene?.interfaceOrientation
        
        if orientation == .landscapeLeft || orientation == .landscapeRight {
            columns = 6
        }else{
            columns = 3
        }
        
        let spacing: CGFloat = 5
        let totalHorizontalSpacing = (columns - 1) * spacing
        
        let itemWidth = (collectionView.bounds.width - totalHorizontalSpacing) / columns
        let itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
}
