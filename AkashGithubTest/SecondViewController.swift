//
//  SecondViewController.swift
//  AkashGithubTest
//
//  Created by Akash More on 13/04/18.
//  Copyright © 2018 Escrow InfoTech. All rights reserved.
//

import UIKit

protocol secondScreenProtocol {
    func getNumberOfCount(_ count:Int)
}

class SecondViewController: UIViewController {

    var secondScreenDelegate: secondScreenProtocol!
    
    @IBOutlet weak var lblLabel: UILabel!
    
    var countD = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnPlus(_ sender: UIButton) {
        print("btn Plus press")
        countD += 1
        
    }

    @IBAction func btnDismiss(_ sender: UIButton) {
        secondScreenDelegate.getNumberOfCount(countD)
        
        self.dismiss(animated: true, completion: nil)
        
        
        
    }
}
