//
//  ViewController.swift
//  SpaceMonitoring
//
//  Created by Alkesh Fudani on 20/01/20.
//

import UIKit
import ObjectMapper

let url : String = "https://spacelaunchnow.me/api/3.3.0/launch/upcoming/?format=json"
let segueId : String = "performSegueDetailViewController"
let tableCell :String = "viewControllerCell"

class ViewController: UIViewController {

    @IBOutlet weak var tblView:UITableView!
    @IBOutlet weak var spinner:UIActivityIndicatorView!
    var arrOfRockets = [MissionModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblView.tableHeaderView = UIView()
        callApi()
    }
    
    func callApi(){
        self.spinner.startAnimating()
        APIManager.get(url) { (error, json) in
            guard let jsonResponse = json else {
                return
            }
            self.arrOfRockets = Mapper<MissionModel>().mapArray(JSONArray: jsonResponse["results"] as! [[String : Any]])
            self.tblView.reloadData()
            self.spinner.stopAnimating()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueId {
            let controller = segue.destination as? DetailViewController
            controller?.shareobj = sender as? MissionModel
        }
    }

}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrOfRockets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: tableCell) as? viewControllerCell else {
            return UITableViewCell()
        }
        cell.imgView?.image = UIImage(named:"rocket")
        cell.setupData(shareobj: self.arrOfRockets[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: segueId, sender: self.arrOfRockets[indexPath.row])
    }
}
