//
//  DownloadTaskInfo.swift
//  AkashGithubTest
//
//  Created by Akash More on 12/04/18.
//  Copyright © 2018 Escrow InfoTech. All rights reserved.
//

import Foundation
import Alamofire


class DownloadTaskInfo{
    var name: String?
    var url: String?
    var isDownloading:Bool = false
    var progress:Float = 0.0
    var request: Alamofire.Request?
    
    init(Name name: String, URL url: String) {
        self.name = name
        self.url = url
    }
}
