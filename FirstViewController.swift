//
//  FirstViewController.swift
//  AkashGithubTest
//
//  Created by Akash More on 24/03/18.
//  Copyright © 2018 Escrow InfoTech. All rights reserved.
//

import UIKit
import SwiftyJSON

//class akash {
//    static var number: Int = 0
//    
//    init() {
//        akash.number += 1
//    }
//    
//    static func getNumber() {
//        print("Number \(number)")
//    }
//}


class FirstViewController: UIViewController {
    
    @IBOutlet weak var tfTextField: UITextField!
    
    
    var userdataObject = [user_data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        ApiService.Login_User(UserName: "Akash1", Password: "1Akash Password")
//        ApiService.Login_User(UserName: "Akash2", Password: "2Akash Password")
//        ApiService.Login_User(UserName: "Akash3", Password: "3Akash Password")
        
//        ApiService.get_detail_of_the_user(User_ID: "5a630cf422f77", OnFailure: { (Error) in
//            print("Error: \(Error)")
//        }) { (JSON) in
//            print("My json: \(JSON)")
//        }

//        ApiService.get_posts_by_followers(User_Id: "5a630cf422f77", Page_No: 1)
        
        ApiService.get_posts_by_followers(User_Id: "5a630cf422f77", Page_No: 1) { (json: JSON) in
            
            //                            print("JSONddd: \(json)")
            
            for data in json["all_data"] {
                let tempData = data.1["user_data"]
                //                    print("PPP: \(tempData)")
                let telmObject = user_data(postDictionary: tempData)
                
                print("TTTTTTTTT: \(telmObject.user_name)")
                self.userdataObject.append(telmObject)
            }
            
            let postdatta = json["all_data"][0]["user_data"]
            print("Post Dataaaaaaaa: \(postdatta)")
            
            for i in 0...self.userdataObject.count-1{
                print("cccc: \(self.userdataObject[i].user_name)")
                print("gggg: \(self.userdataObject[i].user_id)")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnToggleText(_ sender: UIButton) {
        tfTextField.isSecureTextEntry = !tfTextField.isSecureTextEntry
    }
}
