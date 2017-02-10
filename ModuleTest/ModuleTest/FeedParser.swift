//
//  FeedParser.swift
//  ModuleTest
//
//  Created by apple on 17/01/17.
//  Copyright © 2017 Sarath Raveendran. All rights reserved.
//

import Foundation

class FeedParser {
    
    // MARK: Declarations
    static let sharedInstance = FeedParser()
    let keys = ApiResponseKeys()
    
    
    func parse(response: Dictionary<String, Any>, modal: inout Feed, completionHandler: () -> ()) {
        
        modal = Feed()
        modal.success = (response[keys.success] as? Bool) ?? false
           
        /* Division found */
        if let responseFeeds = response[keys.feeds] as? Array<Dictionary<String, Any>>, responseFeeds.count > 0 {
            
            for responseFeed in responseFeeds {
                
                var feedsModal = Feeds()
                feedsModal.id = responseFeed[keys.id] as? String ?? nil
                feedsModal.propertyName = responseFeed[keys.id] as? String ?? nil
                feedsModal.imageUrl = responseFeed[keys.image] as? String ?? nil
                feedsModal.saleDate = responseFeed[keys.sale_date] as? String ?? nil
                feedsModal.distirctName = responseFeed[keys.district_name] as? String ?? nil
                feedsModal.address = responseFeed[keys.address] as? String ?? nil
                feedsModal.saleStatus = responseFeed[keys.sale_status] as? String ?? nil
                feedsModal.isStar = responseFeed[keys.is_star] as? String ?? nil
                feedsModal.commentCount = responseFeed[keys.comment_count] as? String ?? nil
                feedsModal.favorCount = responseFeed[keys.favor_count] as? String ?? nil
                feedsModal.nickName = responseFeed[keys.nick_name] as? String ?? nil
                
                if let developerNames = responseFeed[keys.developer_name] as? Array<String>, developerNames.count > 0 {
                    
                    for developerName in developerNames {
                        
                        var developerNameModal = DeveloperName()
                        developerNameModal.name = developerName
                        
                        // Add
                        feedsModal.developerName.append(developerNameModal)
                    }
                    
                }
                
                // Add
                modal.feeds.append(feedsModal)
                
            }
            
        }
        
        // Done
        completionHandler()
        
    }
    
}
