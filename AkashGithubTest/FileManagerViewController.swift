//
//  FileManagerViewController.swift
//  AkashGithubTest
//
//  Created by Akash More on 24/04/18.
//  Copyright © 2018 Escrow InfoTech. All rights reserved.
//

import UIKit

class FileManagerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("file manager view")
        
        let file = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("Akash.txt")
        print(file)
        
        //the database file
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("HeroesDatabase.sqlite")
        
        
        let dir = FileManager.default.urls(for: FileManager.SearchPathDirectory.cachesDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!
        let fileurl =  dir.appendingPathComponent("log.txt")
        
        createFile()
        
        
        
        // Save data to file
        let fileName = "Test"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        let fileURLd = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        print("FilePath: \(fileURLd.path)")
        

        
    }


    func createFile() {
        let fileName = "Test"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        
        print("File PAth: \(fileURL.path)")
    }
    
}
/*
 
 
 */
