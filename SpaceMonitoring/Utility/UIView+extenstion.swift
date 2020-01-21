//
//  UIView+extenstion.swift
//  SpaceMonitoring
//
//  Created by Alkesh Fudani on 20/01/20.
//


import Foundation
import UIKit

///extra functionlity for UIview class.
extension UIView {
    /**
    Create dropshow
    - Parameter radius: cornerradius of button.
    - Parameter shadow: Shadow radisu.
    
    */
    func dropShadow(radius:CGFloat,shadow:CGFloat){
        self.layer.cornerRadius = radius
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = shadow
    }
    
    /**
     Only corner Radius
     - Parameter radius: cornerradius of button.
     */
    func CornerRadius(radius:CGFloat){
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }

    
    
}

