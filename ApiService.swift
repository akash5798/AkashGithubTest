//
//  ApiService.swift
//  AkashGithubTest
//
//  Created by Akash More on 26/03/18.
//  Copyright © 2018 Escrow InfoTech. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiService: NSObject {
    
    private static var numberOfInstances: Int = 0
    
    override init() {
        ApiService.numberOfInstances += 1
    }
    
    static func ShowNumberOfInstance() {
        print("number of Api Services: \(numberOfInstances)")
    }
    
    //    static let sharedInstance = ApiService()
    
    static func Login_User(UserName username:String, Password pass:String) {
        print("Loggin in with: \n UserName: \(username) \n Password: \(pass) \n URL: \(baseURL.getUserData)")
    }
    
    static func get_detail_of_the_user(User_ID userID:String, OnFailure: (Error) -> (), OnSuccess: (JSON) -> ()){
        
        let parameters:Parameters = [
            "tag": "get_posts_by_followers",
            "user_id": userID,
            "page_no": "1"
        ]
        
        Alamofire.request(baseURL.getUserData, method: .get, parameters: parameters, encoding: URLEncoding.httpBody).responseJSON { (response) in
            print("RESPONSE:- \(response)")
            print(response.result)
            let jsonDict = response.result.value as? [String : Any]
            print(jsonDict)
            
        }
    }
    
    static func get_posts_by_followers(User_Id uid:String, Page_No page: Int, completion: @escaping (JSON) -> () ){
        
        let paramet: Parameters = [
            "tag": "get_posts_by_followers",
            "user_id": uid,
            "page_no": page
        ]
        
        Alamofire.request(baseURL.getUserData, method: .post, parameters: paramet, encoding: URLEncoding.httpBody).responseJSON { response in
            
//            if let jsonDictionary = response.result.value as? [String : Any] {
//                
//                print("Json Dictionary: \(jsonDictionary)")
//                
//                print("PageNumber: \(jsonDictionary["page_number"])")
//                
//                if let all_Data = jsonDictionary["all_data"] as? [Any] {
//                    print("All Data: \(all_Data)")
//                }
//            }
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                completion(json)
                
                
////                print("JSON: \(json)")
//                
//                for data in json["all_data"] {
//                    let tempData = data.1["user_data"]
////                    print("PPP: \(tempData)")
//                    let telmObject = user_data(postDictionary: tempData)
//                    userdataObject.append(telmObject)
//                }
//                
//                let postdatta = json["all_data"][0]["post_data"]
//                print("Post Dataaaaaaaa: \(postdatta)")
//                
//                print("\n\n\n\n\n\n \(userdataObject)")
                
                
            case .failure(let error):
                print(error)
            }

        }
    }
    
}
