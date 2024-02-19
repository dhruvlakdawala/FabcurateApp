//
//  TitleCVCell.swift
//  ClothsApp
//
//  Created by Test on 16/02/24.
//

import UIKit

class TitleCVCell: UICollectionViewCell {

    @IBOutlet weak var vwContainer: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnCellClick: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.initialSetup()
    }
    
    func initialSetup(){
        self.vwContainer.layer.cornerRadius = 5
        self.vwContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        self.vwContainer.layer.masksToBounds = true
        self.imgView.layer.cornerRadius = 5
        self.imgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.imgView.layer.masksToBounds = true
//        self.imgView.contentMode = .center
    }
    
    func bindDataForTitleCell(objMainStickyMenu: MainStickyMenu){
        self.lblTitle.text = objMainStickyMenu.title
        self.imgView.downloaded(from: objMainStickyMenu.image)
    }

}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
