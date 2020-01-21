//
//  missionModel.swift
//  SpaceMonitoring
//
//  Created by Alkesh Fudani on 20/01/20.
//

import Foundation
import ObjectMapper


class MissionModel: NSObject,Mappable {
    
    var name: String?
    var dateAndTime: String?
    var descriptions: String?
    var countyCode: String?
    var image:String?
    var status:String?
    
    required override init() {
    }
    
    required init?(map: Map){
        super.init()
        dateAndTime = self.ConvertServerDateToString(stringDate: map.JSON["window_start"] as! String)
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        status <- map["status.name"]
       // dateAndTime <- map["window_start"]
        descriptions <- map["mission.description"]
        countyCode <- map["pad.location.country_code"]
        image <- map["infographic_url"]
    }
    
    func StringToDate(stringDate:String,formate:String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formate //Your date format
        dateFormatter.locale = Locale.current
        let date = dateFormatter.date(from: stringDate) //according to date format your date string
        return date!
    }
    
    func DateToString(date:Date,formate:String) -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = formate
        let now = dateformatter.string(from: date)
        return now
    }
    
    func ConvertServerDateToString(stringDate:String) -> String {
        let dobDate  = self.StringToDate(stringDate: stringDate, formate: "yyyy-MM-dd'T'HH:mm:ssZ")
        let strDate  = self.DateToString(date:  dobDate , formate: "EEEE,MMM dd hh:mm a")
        return strDate
    }
    
}
