//
//  ReservationTableViewCell.swift
//  Charger
//
//  Created by Muzaffer Berşan Konal on 15.07.2022.
//

import UIKit

class ReservationTableViewCell: UITableViewCell {

    @IBOutlet weak var serviceHours: UILabel!
    @IBOutlet weak var availableSocketCount: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var typeImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var secondLabelContainerView: UIView!
    @IBOutlet weak var labelContainerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 10
        labelContainerView.layer.cornerRadius = labelContainerView.frame.height / 4
        secondLabelContainerView.layer.cornerRadius = secondLabelContainerView.frame.height / 4
        // Initialization code
        self.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
