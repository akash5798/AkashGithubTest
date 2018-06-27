//
//  ApiURLs.swift
//  AkashGithubTest
//
//  Created by Akash More on 26/03/18.
//  Copyright © 2018 Escrow InfoTech. All rights reserved.
//

// Accessible via
// baseURL.LogIn
// baseURL.LogOut

import Foundation

struct baseURL{
    
    private static var numberOfInstances: Int = 0

    init() {
        baseURL.numberOfInstances += 1
    }

    static func ShowNumberOfInstance() {
        print("number of Base Url: \(numberOfInstances)")
    }
    
    private struct Domain{
        static let Development_Url = "192.168.0.100:8080/"
        static let Production_Url = "http://mobileadsservice.com/share_chat/pages/"
    }
    private static let Current_Working_URL = Domain.Production_Url
//    private static let Current_Working_URL = Domain.Development_Url
    
    
    
    
    static var getUserData: String{
        return Current_Working_URL + "postdata.php"
    }
    
}
