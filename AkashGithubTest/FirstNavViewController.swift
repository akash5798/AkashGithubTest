//
//  FirstNavViewController.swift
//  AkashGithubTest
//
//  Created by Akash More on 16/04/18.
//  Copyright © 2018 Escrow InfoTech. All rights reserved.
//

import UIKit

class FirstNavViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("1 view did load")
    }

    
    override func viewWillAppear(_ animated: Bool) {
        print("1 view will appear")
    }

    override func viewDidAppear(_ animated: Bool) {
        print("1 view did appear")
    }
    
    override func viewWillLayoutSubviews() {
        print("1 view will layout subview")
    }
    
    override func viewDidLayoutSubviews() {
        print("1 view did layout subview")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("1 view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("1 view did disappear")
    }
    
    deinit {
        print("1 deinit")
    }
}

