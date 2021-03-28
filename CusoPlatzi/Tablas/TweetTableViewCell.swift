//
//  TweetTableViewCell.swift
//  CusoPlatzi
//
//  Created by Jorge Lopez on 27/03/21.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImageView: UIView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImageView.clipsToBounds = true
        
        userImageView.layer.cornerRadius = userImageView.frame.width / 2; 
    }
    
    func setupCell(username: String, message: String) {
        usernameLabel.text = username
        messageLabel.text = message
         
        
    }

    
}
