//
//  detailViewController.swift
//  SpaceMonitoring
//
//  Created by Alkesh Fudani on 20/01/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var viewLocation:UIView!
    @IBOutlet weak var lblCountryCode:UILabel!
    @IBOutlet weak var viewStatus:UIView!
    @IBOutlet weak var lblStatus:UILabel!
    @IBOutlet weak var lblName:UILabel!
    @IBOutlet weak var lblDate:UILabel!
    @IBOutlet weak var lblDescription:UILabel!
    @IBOutlet weak var imgView:UIImageView!
    
    var shareobj:MissionModel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewLocation.roundCorners([UIRectCorner.bottomLeft], radius: 100)
        viewStatus.dropShadow(radius: 20, shadow: 5)
        self.setupData()
        // Do any additional setup after loading the view.
    }
    
    func setupData(){
        lblName.text = shareobj.name
        lblDescription.text = shareobj.descriptions
        lblCountryCode.text = shareobj.countyCode
        lblStatus.text = shareobj.status
        
        guard let dateAndTime = shareobj.dateAndTime else {
            return
        }
        lblDate.text = "Date: \(dateAndTime)"

        
        guard let imageUrl = shareobj.image else {
            return
        }
        imgView.LoadImage(url: imageUrl)
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
