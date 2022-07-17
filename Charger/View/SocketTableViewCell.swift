//
//  SocketTableViewCell.swift
//  Charger
//
//  Created by Muzaffer Berşan Konal on 17.07.2022.
//

import UIKit

class SocketTableViewCell: UITableViewCell {

   
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var hourLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius = containerView.frame.height / 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
