//
//  Utils.swift
//  ModuleTest
//
//  Created by apple on 17/01/17.
//  Copyright © 2017 Sarath Raveendran. All rights reserved.
//

import Foundation
import UIKit

let logActivity = true
let imageCache = NSCache<NSString, UIImage>()


// Server connection
class ApiConnection {
    static let sharedInstance = ApiConnection()
    
    let scheme = "https"
    let host = "api.nasa.gov"
    /*
    let baseUrl = "http://54.254.204.73/api/"
    let feeds = "property/feeds"
     */
    let baseUrl = "https://itunes.apple.com/"
    let feeds = "search?media=music&entity=song"
    
    let primaryUrlImageUpload = "http://www.swiftdeveloperblog.com/"
    let upload = "http-post-example-script/"
    
    
}

// Response Keys
class ApiResponseKeys {
    static let sharedInstance = ApiResponseKeys()
    
    // Feeds
    let success = "success"
    let feeds = "feeds"
    let id = "id"
    let property_name = "property_name"
    let image = "image"
    let sale_date = "sale_date"
    let district_name = "district_name"
    let address = "address"
    let sale_status = "sale_status"
    let is_star = "is_star"
    let comment_count = "comment_count"
    let favor_count = "favor_count"
    let developer_name = "developer_name"
    let nick_name = "nick_name"
    
}

// GET and POST methods params
class ApiGetPostKeys {
    static let sharedInstance = ApiGetPostKeys()
    
    // Feed
    let lang = "lang"
    
}


class UtilityMessages {
    static let sharedInstance = UtilityMessages()
    
    let noConnection = "No internet connection detected!"
    
}

class Colors {
    static let sharedInstance = Colors()
    
    let feedPageSaleText = UIColor(hexString: "#3289C7") 
    let feedPageBackground = UIColor.black
}






