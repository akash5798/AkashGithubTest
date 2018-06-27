//
//  DownloadViewController.swift
//  AkashGithubTest
//
//  Created by Akash More on 12/04/18.
//  Copyright © 2018 Escrow InfoTech. All rights reserved.
//
// oAuth key = : 930777215913-r4tbag2bcnpt0vico7oauj3baq6s7ve8.apps.googleusercontent.com
//


import UIKit
import Alamofire
import GoogleSignIn

class DownloadViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, GIDSignInDelegate, GIDSignInUIDelegate {

    var countDownloaddddd: Int = 0
    
    @IBOutlet weak var lblCount: UILabel!
    
    
    let serverURLofMusicFile = "http://mobileadsservice.com/share_chat/upload_media/audios/1516339041.mp3"
    
    let tableCellIdentifier = "cell"
    
    @IBOutlet weak var downlodProgreeView: UIProgressView!
    
    @IBOutlet weak var tblTableView: UITableView!
    
    
    let downloalURL = "asdfa"
    var downloadTaskArray = [DownloadTaskInfo]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        let googleSighInButton = GIDSignInButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        googleSighInButton.center = view.center
        
        
        
        
        view.addSubview(googleSighInButton)
        
        let a = DownloadTaskInfo(Name: "First.mp3", URL: "http://mobileadsservice.com/share_chat/upload_media/audios/1516339041.mp3")
        downloadTaskArray.append(a)
        
        let b = DownloadTaskInfo(Name: "Second.mp3", URL: "http://mobileadsservice.com/share_chat/upload_media/audios/1516339041.mp3")
        downloadTaskArray.append(b)
        
        let c = DownloadTaskInfo(Name: "Third.mp3", URL: "http://mobileadsservice.com/share_chat/upload_media/audios/1516339041.mp3")
        downloadTaskArray.append(c)
        
        let d = DownloadTaskInfo(Name: "Fourth.mp3", URL: "http://mobileadsservice.com/share_chat/upload_media/audios/1516339041.mp3")
        downloadTaskArray.append(d)
        
        let e = DownloadTaskInfo(Name: "Fifth.mp3", URL: "http://mobileadsservice.com/share_chat/upload_media/audios/1516339041.mp3")
        downloadTaskArray.append(e)
        
        //        self.tblTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: tableCellIdentifier)
        self.tblTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: tableCellIdentifier)
        
        tblTableView.delegate = self
        tblTableView.dataSource = self
        
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil {
            print(error ?? "Some error while signing in user with google")
            return
        }
        
        print("asdfdsfa\(user.profile.email)")
        print(user.profile.description)
        print(user.profile.name)
        print(user.profile.familyName)
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        print("Count in download Screen \(countDownloaddddd)")
//        print("User Id: \(GIDSignIn.sharedInstance().currentUser.userID)")
//        print("email: \(GIDSignIn.sharedInstance().currentUser.profile.email)")
//        print("name: \(GIDSignIn.sharedInstance().currentUser.profile.name)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        if let userName = GIDSignIn.sharedInstance().currentUser.profile.name {
//        print("User's name is: \(userName)")
//        }
    }
    
    @IBAction func startDownload(_ sender: UIButton) {
        print("Start download")
        
        downloadFiles(number: 0)
        
    }
    
    
    @IBAction func pauseDownload(_ sender: UIButton){
        print("pause download")
    }
    
    @IBAction func stopDownload(_ sender: UIButton){
        print("stop download")
        
        downloadTaskArray[0].request?.cancel()
        
    }
    
    func downloadFiles(number:Int) {
    
//    func downloadFiles() {
    
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            var documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            documentsURL.appendPathComponent(self.downloadTaskArray[number].name!)
            return (documentsURL, [.removePreviousFile])
        }
        
        downloadTaskArray[number].isDownloading = true
        
        let asdf = Alamofire.download(downloadTaskArray[number].url!, to: destination).downloadProgress(queue: DispatchQueue.main) { (Progress) in
            print("Progress:- \(Progress.fractionCompleted)")
            
            if let tableCell = self.tblTableView.cellForRow(at: IndexPath(row: number, section: 0)) as? CustomTableViewCell {
                tableCell.progressDownload.progress = Float(Progress.fractionCompleted)
            }
            
//            self.downloadTaskArray[number].progress = Float(Progress.fractionCompleted)
            self.downlodProgreeView.progress = Float(Progress.fractionCompleted)
            
        }.responseData { (response) in
//            print(response.destinationURL!.lastPathComponent)
            print(response.destinationURL)
        }
        
        downloadTaskArray[number].request = asdf
        print("Request: \(downloadTaskArray[number].request)")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return downloadTaskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellIdentifier, for: indexPath) as? CustomTableViewCell
        //30%, 20%, 15%, 10%, and 25%
        let cell = Bundle.main.loadNibNamed("CustomTableViewCell", owner: self, options: nil)?.first as! CustomTableViewCell
        
        cell.lblTitleLabel.text = downloadTaskArray[indexPath.row].name
        cell.progressDownload.progress = downloadTaskArray[indexPath.row].progress
        
//        cell.btnPauseButton.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControlEvents#>)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let asdf = indexPath.row
        downloadFiles(number: asdf)
    }
    
    func pauseDownload()  {
        print("Pause download")
    }
    
    
    @IBAction func btnNextScreen(_ sender: UIButton) {
        let secondScreen = SecondViewController(nibName: "SecondViewController", bundle: nil) as SecondViewController
        secondScreen.secondScreenDelegate = self
//        let navigation = UINavigationController(rootViewController: self)
        self.present(secondScreen, animated: true, completion: nil)
    }
}

extension DownloadViewController: secondScreenProtocol {
    internal func getNumberOfCount(_ count: Int) {
        countDownloaddddd = count
    }
}
/*
 
 
 
 
 
 
 */
