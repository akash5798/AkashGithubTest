//
//  DataModel.swift
//  AkashGithubTest
//
//  Created by Akash More on 27/03/18.
//  Copyright © 2018 Escrow InfoTech. All rights reserved.
//

import Foundation
import SwiftyJSON
 
struct json_Keys {
    static let isNotification = "is_notification_on"
    static let posttype = "post_type"
    static let postheight = "post_height"
    
    static let username = "user_name"
    static let isblocked = "is_blocked"
    static let userid = "user_id"
}

class post_card {
    
    var postData: post_data?
    var userData: user_data?
    
}


class post_data {
    
    var is_notification_on: Bool?
    var post_type: String?
    var post_height: Int?
    
    init(postDictionary: [String : Any]) {
        is_notification_on = postDictionary[json_Keys.isNotification] as? Bool
        post_height = postDictionary[json_Keys.postheight] as? Int
        post_type = postDictionary[json_Keys.posttype] as? String
    }
}


class user_data {
    var user_name: String?
    var is_blocked: Bool?
    var user_id: Int?
    
    init(postDictionary: JSON) {
        print("DDDDDDDD: \(postDictionary[json_Keys.username])")
//        self.user_name = "Akash"
        user_name = postDictionary[json_Keys.username].string
        is_blocked = postDictionary[json_Keys.isblocked].bool
        user_id = postDictionary[json_Keys.userid].int
    }
}



/*
 
 
 
 
 

 
 */
