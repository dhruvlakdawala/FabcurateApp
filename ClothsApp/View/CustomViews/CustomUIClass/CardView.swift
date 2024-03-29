//
//  CardView.swift
//  ClothsApp
//
//  Created by Test on 17/02/24.
//

import Foundation
import UIKit

@IBDesignable
class CardView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 10

    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 0
    @IBInspectable var shadowColor: UIColor? /*= UIColor.AppCustomColor.placeholder*/
    @IBInspectable var shadowOpacity: Float = 0.5

    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        self.subviews.forEach({$0.clipsToBounds  = true})
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)

        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }

    func setBottomRoundCorners(){
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    func setTopRoundCorners() {
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    func setAllRoundCorners(){
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
}
