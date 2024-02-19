//
//  CategoryViewController.swift
//  ClothsApp
//
//  Created by Test on 19/02/24.
//

import UIKit
import ExpyTableView

class CategoryViewController: UIViewController, ExpyTableViewDataSource, ExpyTableViewDelegate {
    
    @IBOutlet weak var tvExpandableCategory: ExpyTableView!
    @IBOutlet weak var customNavigationBar: NavigationBar!
    
    var arrCategories: [Category]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initialSetup()
        self.getCategoryData()
    }
    
    func initialSetup(){
        self.customNavigationBar.leftButton.isHidden = true
        self.customNavigationBar.titleLabel.text = "Category"
        
        self.tvExpandableCategory.dataSource = self
        self.tvExpandableCategory.delegate = self
        
        self.tvExpandableCategory.register(UINib(nibName: "HeaderExpandCell", bundle: nil), forCellReuseIdentifier: "HeaderExpandCell")
        self.tvExpandableCategory.register(UINib(nibName: "ExpandTableCell", bundle: nil), forCellReuseIdentifier: "ExpandTableCell")
    }
    
    func getCategoryData(){
        APIManager.sharedInstance.getCategoryRepositoryData { isSuccess, arrCategories in
            if isSuccess {
                self.arrCategories = arrCategories
                DispatchQueue.main.async {
                    self.tvExpandableCategory.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: ExpyTableView, expandableCellForSection section: Int) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: "HeaderExpandCell")) as! HeaderExpandCell
        
        cell.lblCatgoryName.text = "\(arrCategories?[section].categoryName ?? "")"
        if section % 2 == 1 {
            cell.vwContainer.backgroundColor = UIColor(hex: "#8FE0F4")
            cell.vwCategory.backgroundColor = UIColor(hex: "#8FE0F4")
            cell.lblCatgoryName.backgroundColor = UIColor(hex: "#8FE0F4")
        }else{
            cell.vwContainer.backgroundColor = UIColor(hex: "#E3A186")
            cell.vwCategory.backgroundColor = UIColor(hex: "#E3A186")
            cell.lblCatgoryName.backgroundColor = UIColor(hex: "#E3A186")
        }
        return cell
    }
    
    func tableView(_ tableView: ExpyTableView, canExpandSection section: Int) -> Bool {
        return ExpyTableViewDefaultValues.expandableStatus
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrCategories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (arrCategories?[section].child?.count ?? 0) + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: "ExpandTableCell")) as! ExpandTableCell
        cell.lblSubCategoryName.text = "\(arrCategories?[indexPath.section].child?[indexPath.row - 1].categoryName ?? "")"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        print(arrCategories?[indexPath.section].child?[indexPath.row].categoryName ?? "")
    }
    
    func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int) {
        print("Current state: \(state)")
    }
}
