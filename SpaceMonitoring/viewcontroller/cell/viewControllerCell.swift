//
//  viewControllerCell.swift
//  SpaceMonitoring
//
//  Created by Alkesh Fudani on 20/01/20.
//

import UIKit

class viewControllerCell: UITableViewCell {

    @IBOutlet weak var viewLocation:UIView!
    @IBOutlet weak var lblCountryCode:UILabel!
    @IBOutlet weak var viewStatus:UIView!
    @IBOutlet weak var lblStatus:UILabel!
    @IBOutlet weak var lblName:UILabel!
    @IBOutlet weak var lblDate:UILabel!
    @IBOutlet weak var lblDescription:UILabel!
    @IBOutlet weak var imgView:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewLocation.roundCorners([UIRectCorner.bottomLeft], radius: 100)
//        viewStatus.dropShadow(radius: 20, shadow: 5)
        
    }
    
    func setupData(shareobj:MissionModel){
        lblName.text = shareobj.name
        lblCountryCode.text = shareobj.countyCode
        guard let dateAndTime = shareobj.dateAndTime else {
            return
        }
        lblDate.text = "Date: \(dateAndTime)"

        guard let imageUrl = shareobj.image else {
            return
        }
        imgView.LoadImage(url: imageUrl)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
