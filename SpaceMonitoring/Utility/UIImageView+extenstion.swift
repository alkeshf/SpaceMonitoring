//
//  UIImageView+extenstion.swift
//  SpaceMonitoring
//
//  Created by Alkesh Fudani on 20/01/20.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    internal func changeTintColor(color:UIColor){
        let image = self.image?.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
        self.image = image
    }
    
    func LoadImage(url:String) -> Void {
        
       if(url == ""){
           return
       }
       self.sd_imageIndicator = SDWebImageActivityIndicator.whiteLarge
       self.sd_setImage(with: URL(string: url), placeholderImage: nil, options: .highPriority, completed: { (img:UIImage?, error:Error?, type:SDImageCacheType, url:URL?) in
           self.image = img
       })
    }
    
   
}
