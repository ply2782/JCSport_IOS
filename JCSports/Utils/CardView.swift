//
//  CardView.swift
//  JCSports
//
//  Created by 바틀 on 2022/12/12.
//

import Foundation
import UIKit


@IBDesignable class CardView : UIView{
    
    var cornerRadius : CGFloat = 13
    var offsetWidth : CGFloat = 0
    var offsetHeight : CGFloat = 2
    var offsetShadowOpacitiy : Float = 5
    var color = UIColor.gray
    
    override func layoutSubviews() {
        layer.cornerRadius = self.cornerRadius
        layer.shadowColor = self.color.cgColor
        layer.shadowOffset = CGSize(width: self.offsetWidth, height: self.offsetHeight)
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius).cgPath
        layer.shadowOpacity = self.offsetShadowOpacitiy
    }
    
    override init(frame: CGRect) {
           super.init(frame: frame)
        
       }
       
       required init?(coder: NSCoder) {
           super.init(coder: coder)
           
       }
       
      
    
}
