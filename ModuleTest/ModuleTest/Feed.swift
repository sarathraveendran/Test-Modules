//
//  Modal.swift
//  ModuleTest
//
//  Created by apple on 17/01/17.
//  Copyright © 2017 Sarath Raveendran. All rights reserved.
//

import Foundation

struct Feed {
    var success: Bool?
    var feeds = Array<Feeds>()
}

struct Feeds {
    var id: String?
    var propertyName: String?
    var imageUrl: String?
    var saleDate: String?
    var distirctName: String?
    var address: String?
    var saleStatus: String?
    var isStar: String?
    var commentCount: String?
    var favorCount: String?
    var nickName: String?
    
    var developerName = Array<DeveloperName>()
}

struct DeveloperName {
    var name: String?
}
