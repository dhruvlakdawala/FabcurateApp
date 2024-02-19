//
//  HomeViewController.swift
//  ClothsApp
//
//  Created by Test on 16/02/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tblFabrics: UITableView!
    @IBOutlet weak var customNavigationBar: NavigationBar!
    
    var arrTopMainStickyMenu: [MainStickyMenu]?
    var objMiddleRepositoryData: MiddleRepository?
    var objBottomRepositoryData: BottomRepository?
    
    var selectedIndexForStickyMenu = 0
    var cvBoutiqueWidth: CGFloat = 0
    
    let arrHeaders = ["", "Shop By Category", "Shop By Fabric Material", "Unstitched", "Boutique Collection", "Range Of Pattern", "Design As Per Occassion"]
    
    let dispatchGroup = DispatchGroup()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initialSetup()
        self.configureTableView()
        self.apiCalling()
    }

    // MARK: - Private Methods
    func initialSetup(){
        self.tblFabrics.dataSource = self
        self.tblFabrics.delegate = self
        self.tblFabrics.sectionHeaderTopPadding = 0
        self.customNavigationBar.leftButton.isHidden = false
        self.customNavigationBar.titleLabel.text = ""
    }
    
    func configureTableView(){
        // table nib register
        self.tblFabrics.register(UINib(nibName: "TitleTVCell", bundle : nil), forCellReuseIdentifier: "TitleTVCell")
        self.tblFabrics.register(UINib(nibName: "SliderImageTVCell", bundle : nil), forCellReuseIdentifier: "SliderImageTVCell")
        self.tblFabrics.register(UINib(nibName: "CategoryCell", bundle : nil), forCellReuseIdentifier: "CategoryCell")
        self.tblFabrics.register(UINib(nibName: "CategoryBottomCell", bundle : nil), forCellReuseIdentifier: "CategoryBottomCell")
        self.tblFabrics.register(UINib(nibName: "FabricTVCell", bundle : nil), forCellReuseIdentifier: "FabricTVCell")
        self.tblFabrics.register(UINib(nibName: "FabricBottomTVCell", bundle : nil), forCellReuseIdentifier: "FabricBottomTVCell")
        self.tblFabrics.register(UINib(nibName: "UnstitchedTVCell", bundle : nil), forCellReuseIdentifier: "UnstitchedTVCell")
        self.tblFabrics.register(UINib(nibName: "BoutiqueTVCell", bundle : nil), forCellReuseIdentifier: "BoutiqueTVCell")
        self.tblFabrics.register(UINib(nibName: "RangePatternTVCell", bundle : nil), forCellReuseIdentifier: "RangePatternTVCell")
        self.tblFabrics.register(UINib(nibName: "RangePatternBottomTVCell", bundle : nil), forCellReuseIdentifier: "RangePatternBottomTVCell")
        self.tblFabrics.register(UINib(nibName: "OccassionDesignTVCell", bundle : nil), forCellReuseIdentifier: "OccassionDesignTVCell")
        self.tblFabrics.register(UINib(nibName: "HeaderCell", bundle : nil), forHeaderFooterViewReuseIdentifier: "HeaderCell")
    }
    
    func apiCalling(){
        self.getTopRepositoryData()
        self.getMiddleRepositoryData()
        self.getBottomRepositoryData()
        
        // Notify when all API calls are finished
        dispatchGroup.notify(queue: .main) {
            self.tblFabrics.reloadData()
            print("Final Table Reload")
        }
    }
    
    func getTopRepositoryData(){
        self.dispatchGroup.enter()
        APIManager.sharedInstance.getTopRepositoryData { isSuccess, arrTopRepositoryData in
            defer {
                self.dispatchGroup.leave()
            }
            if isSuccess {
                self.arrTopMainStickyMenu = arrTopRepositoryData
            }
        }
    }
    
    func getMiddleRepositoryData(){
        self.dispatchGroup.enter()
        APIManager.sharedInstance.getMiddleRepositoryData { isSuccess, objMiddleRepository in
            defer {
                self.dispatchGroup.leave()
            }
            if isSuccess {
                self.objMiddleRepositoryData = objMiddleRepository
            }
        }
    }
    
    func getBottomRepositoryData(){
        self.dispatchGroup.enter()
        APIManager.sharedInstance.getBottomRepositoryData { isSuccess, objBottomRepository in
            defer {
                self.dispatchGroup.leave()
            }
            if isSuccess {
                self.objBottomRepositoryData = objBottomRepository
            }
        }
    }
    
    @objc func tapped(_ sender: UIButton){
        self.selectedIndexForStickyMenu = sender.tag
        self.tblFabrics.reloadRows(at: [IndexPath(item: 1, section: 0)], with: .automatic)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return self.arrTopMainStickyMenu?.count ?? 1
        }else if collectionView.tag == 1 {
            return self.arrTopMainStickyMenu?[selectedIndexForStickyMenu].sliderImages?.count ?? 1
        }else if collectionView.tag == 2 {
            let categoryData = self.objMiddleRepositoryData?.shopByCategory.split()
            return categoryData?.left.count ?? 1
        }else if collectionView.tag == 3 {
            let categoryData = self.objMiddleRepositoryData?.shopByCategory.split()
            return categoryData?.right.count ?? 1
        }else if collectionView.tag == 4 {
            let fabricData = self.objMiddleRepositoryData?.shopByFabric.split()
            return fabricData?.left.count ?? 1
        }else if collectionView.tag == 5 {
            let fabricData = self.objMiddleRepositoryData?.shopByFabric.split()
            return fabricData?.right.count ?? 1
        }else if collectionView.tag == 6 {
            return self.objMiddleRepositoryData?.unstitched.count ?? 1
        }else if collectionView.tag == 7 {
            return self.objMiddleRepositoryData?.boutiqueCollection.count ?? 1
        }else if collectionView.tag == 8 {
            let rangePatternData = self.objBottomRepositoryData?.rangeOfPattern.split()
            return rangePatternData?.left.count ?? 1
        }else if collectionView.tag == 9 {
            let rangePatternData = self.objBottomRepositoryData?.rangeOfPattern.split()
            return rangePatternData?.right.count ?? 1
        }else if collectionView.tag == 10 {
            return self.objBottomRepositoryData?.designOccasion.count ?? 1
        } else{
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didBeginMultipleSelectionInteractionAt indexPath: IndexPath) {
        if collectionView.tag == 0 {
            self.selectedIndexForStickyMenu = indexPath.row
            print("SelectedIndexForStickyMenu ==> \(self.selectedIndexForStickyMenu)")
            self.tblFabrics.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCVCell", for: indexPath) as? TitleCVCell {
                if let objMainStickyMenu = self.arrTopMainStickyMenu?[indexPath.row] {
                    cell.bindDataForTitleCell(objMainStickyMenu: objMainStickyMenu)
                    cell.btnCellClick.tag = indexPath.row
                    cell.btnCellClick.addTarget(self, action: #selector(self.tapped(_:)), for: .touchUpInside)
                }
                return cell
            }
        }else if collectionView.tag == 1 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderImagesCVCell", for: indexPath) as? SliderImagesCVCell {
                if let objSliderImage = self.arrTopMainStickyMenu?[selectedIndexForStickyMenu].sliderImages?[indexPath.row] {
                    cell.bindDataForSliderCell(objMainStickyData: objSliderImage)
                }
                return cell
            }
        }else if  collectionView.tag == 2 || collectionView.tag == 3 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCVCell", for: indexPath) as? CategoryCVCell {
                if collectionView.tag == 2 {
                    if let objCategory = self.objMiddleRepositoryData?.shopByCategory.split().left[indexPath.row] {
                        cell.bindDataForCategory(objCategory: objCategory)
                    }
                }
                if collectionView.tag == 3 {
                    if let objCategory = self.objMiddleRepositoryData?.shopByCategory.split().right[indexPath.row] {
                        cell.bindDataForCategory(objCategory: objCategory)
                    }
                }
                return cell
            }
        }else if  collectionView.tag == 4 || collectionView.tag == 5 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FabricAndRangePatternCVCell", for: indexPath) as? FabricAndRangePatternCVCell {
                if collectionView.tag == 4 {
                    if let objFabric = self.objMiddleRepositoryData?.shopByFabric.split().left[indexPath.row] {
                        cell.bindDataForFabric(objFabric: objFabric)
                    }
                }
                if collectionView.tag == 5 {
                    if let objFabric = self.objMiddleRepositoryData?.shopByFabric.split().right[indexPath.row] {
                        cell.bindDataForFabric(objFabric: objFabric)
                    }
                }
                return cell
            }
        }else if  collectionView.tag == 6 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UnstitchedCVCell", for: indexPath) as? UnstitchedCVCell {
                if let objUnstitched = self.objMiddleRepositoryData?.unstitched[indexPath.row] {
                    cell.bindDataForUnstitched(objUnstitched: objUnstitched)
                }
                return cell
            }
        }else if  collectionView.tag == 7 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BoutiqueCVCell", for: indexPath) as? BoutiqueCVCell {
                print("Cell Width & Height ==> \(cell.layer.bounds.width) & \(cell.layer.bounds.height)")
                if let objBoutique = self.objMiddleRepositoryData?.boutiqueCollection[indexPath.row] {
                    cell.bindDataForBoutiqueCollection(objBoutique: objBoutique)
                }
                return cell
            }
        }else if  collectionView.tag == 8 || collectionView.tag == 9 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FabricAndRangePatternCVCell", for: indexPath) as? FabricAndRangePatternCVCell {
                if collectionView.tag == 8 {
                    if let objRangePattern = self.objBottomRepositoryData?.rangeOfPattern.split().left[indexPath.row] {
                        cell.bindDataForRangeOfPattern(objRangePattern: objRangePattern)
                    }
                }
                if collectionView.tag == 9 {
                    if let objRangePattern = self.objBottomRepositoryData?.rangeOfPattern.split().right[indexPath.row] {
                        cell.bindDataForRangeOfPattern(objRangePattern: objRangePattern)
                    }
                }
                return cell
            }
        } else if collectionView.tag == 10 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OccassionDesignCVCell", for: indexPath) as? OccassionDesignCVCell {
                if let objOccassionDesign = self.objBottomRepositoryData?.designOccasion[indexPath.row] {
                    cell.bindDataForOccassionDesign(objOccassionDesign: objOccassionDesign)
                }
                return cell
            }
        }
        return UICollectionViewCell()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == 4 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BoutiqueTVCell", for: indexPath) as? BoutiqueTVCell {
                cell.myPageControl.currentPage = indexPath.row
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }else{
            return 50
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tblFabrics.dequeueReusableHeaderFooterView(withIdentifier: "HeaderCell") as! HeaderCell
        headerView.lblTitle.text = self.arrHeaders[section]
        return headerView
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }else if section == 1 || section == 2 || section == 5 {
            return 2
        }else if section == 3 || section == 4 {
            return 1
        }else if section == 6 {
            return 1
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return 105
        }else if indexPath.section == 0 && indexPath.row == 1 {
            return 130
        }else if (indexPath.section == 1 && indexPath.row == 0) ||
            (indexPath.section == 1 && indexPath.row == 1) {
            return 200
        }else if (indexPath.section == 2 && indexPath.row == 0) ||
            (indexPath.section == 2 && indexPath.row == 1) {
            return 155
        }else if indexPath.section == 3 {
            return 280
        }else if indexPath.section == 4 {
            return 350
        }else if (indexPath.section == 5 && indexPath.row == 0) ||
            (indexPath.section == 5 && indexPath.row == 1) {
            return 155
        }else if indexPath.section == 6 && indexPath.row == 0 {
            let totalCells = self.objBottomRepositoryData?.designOccasion.count ?? 0
            let totalRows = ceil(Double(totalCells / 3))
            return totalRows * 170
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TitleTVCell", for: indexPath) as? TitleTVCell {
                cell.cvTitles.delegate = self
                cell.cvTitles.dataSource = self
                cell.cvTitles.tag = 0
                cell.cvTitles.reloadData()
                return cell
            }
        }else if indexPath.section == 0 && indexPath.row == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SliderImageTVCell", for: indexPath) as? SliderImageTVCell {
                cell.cvSliderImages.delegate = self
                cell.cvSliderImages.dataSource = self
                cell.cvSliderImages.tag = 1
                cell.cvSliderImages.reloadData()
                return cell
            }
        }else if indexPath.section == 1 && indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as? CategoryCell {
                cell.cvCategory.delegate = self
                cell.cvCategory.dataSource = self
                cell.cvCategory.tag = 2
                cell.cvCategory.reloadData()
                return cell
            }
        }else if indexPath.section == 1 && indexPath.row == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryBottomCell", for: indexPath) as? CategoryBottomCell {
                cell.cvCategory.delegate = self
                cell.cvCategory.dataSource = self
                cell.cvCategory.tag = 3
                cell.cvCategory.reloadData()
                return cell
            }
        }else if indexPath.section == 2 && indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "FabricTVCell", for: indexPath) as? FabricTVCell {
                cell.cvFabrics.delegate = self
                cell.cvFabrics.dataSource = self
                cell.cvFabrics.tag = 4
                cell.cvFabrics.reloadData()
                return cell
            }
        }else if indexPath.section == 2 && indexPath.row == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "FabricBottomTVCell", for: indexPath) as? FabricBottomTVCell {
                cell.cvFabrics.delegate = self
                cell.cvFabrics.dataSource = self
                cell.cvFabrics.tag = 5
                cell.cvFabrics.reloadData()
                return cell
            }
        }else if indexPath.section == 3 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "UnstitchedTVCell", for: indexPath) as? UnstitchedTVCell {
                cell.cvUnstitched.delegate = self
                cell.cvUnstitched.dataSource = self
                cell.cvUnstitched.tag = 6
                cell.cvUnstitched.reloadData()
                return cell
            }
        }else if indexPath.section == 4 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BoutiqueTVCell", for: indexPath) as? BoutiqueTVCell {
                cell.cvBoutique.delegate = self
                cell.cvBoutique.dataSource = self
                cell.cvBoutique.tag = 7
                cell.cvBoutique.reloadData()
                self.cvBoutiqueWidth = cell.cvBoutique.frame.width
                return cell
            }
        }else if indexPath.section == 5 && indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "RangePatternTVCell", for: indexPath) as? RangePatternTVCell {
                cell.cvRangePattern.delegate = self
                cell.cvRangePattern.dataSource = self
                cell.cvRangePattern.tag = 8
                cell.cvRangePattern.reloadData()
                return cell
            }
        }else if indexPath.section == 5 && indexPath.row == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "RangePatternBottomTVCell", for: indexPath) as? RangePatternBottomTVCell {
                cell.cvRangePattern.delegate = self
                cell.cvRangePattern.dataSource = self
                cell.cvRangePattern.tag = 9
                cell.cvRangePattern.reloadData()
                return cell
            }
        }else if indexPath.section == 6 && indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "OccassionDesignTVCell", for: indexPath) as? OccassionDesignTVCell {
                cell.cvOccassionDesign.delegate = self
                cell.cvOccassionDesign.dataSource = self
                cell.cvOccassionDesign.tag = 10
                cell.cvOccassionDesign.reloadData()
                print("CollectionView Width & Height ==> \(cell.cvOccassionDesign.layer.bounds.width) & \(cell.cvOccassionDesign.layer.bounds.height)")
                
                // Configure the collection view layout to display three columns
                if let flowLayout = cell.cvOccassionDesign.collectionViewLayout as? UICollectionViewFlowLayout {
                    let itemSpacing: CGFloat = 0
                    let itemsPerRow: CGFloat = 3
                    let totalSpacing = itemSpacing * (itemsPerRow)
                    let itemWidth = (cell.cvOccassionDesign.bounds.width - totalSpacing) / itemsPerRow
                    flowLayout.itemSize = CGSize(width: itemWidth + 10, height: itemWidth + 10) // Set your desired height
                    flowLayout.minimumInteritemSpacing = itemSpacing
                    flowLayout.minimumLineSpacing = itemSpacing
                }
                return cell
            }
        }
        return UITableViewCell()
    }
}

