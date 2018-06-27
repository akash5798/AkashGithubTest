//
//  CustomTableViewCell.swift
//  AkashGithubTest
//
//  Created by Akash More on 12/04/18.
//  Copyright © 2018 Escrow InfoTech. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblTitleLabel: UILabel!
    
    @IBOutlet weak var progressDownload: UIProgressView!
    
    @IBOutlet weak var btnPauseButton: UIButton!
    
    @IBOutlet weak var btnStopButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
