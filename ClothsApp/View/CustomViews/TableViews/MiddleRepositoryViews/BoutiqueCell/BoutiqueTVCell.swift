//
//  BoutiqueTVCell.swift
//  ClothsApp
//
//  Created by Test on 17/02/24.
//

import UIKit

class BoutiqueTVCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var cvBoutique: UICollectionView!
    @IBOutlet weak var myPageControl: UIPageControl!
    
    var cvBoutiqueWidth: CGFloat = 0
    var numberOfItems: Int = 0
    var arrBoutiqueCollections: [BoutiqueCollection]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.inititalSetup()
    }
    
    func inititalSetup(){
        self.cvBoutique.register(UINib(nibName: "BoutiqueCVCell", bundle : nil), forCellWithReuseIdentifier: "BoutiqueCVCell")
        self.cvBoutique.tag = 7
        self.cvBoutique.delegate = self
        self.cvBoutique.dataSource = self
        self.cvBoutique.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrBoutiqueCollections?.count ?? 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BoutiqueCVCell", for: indexPath) as? BoutiqueCVCell {

            if let objBoutique = self.arrBoutiqueCollections?[indexPath.row] {
                cell.bindDataForBoutiqueCollection(objBoutique: objBoutique)
            }
            return cell

        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width - 20, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.myPageControl.currentPage = indexPath.row
    }
    
}
