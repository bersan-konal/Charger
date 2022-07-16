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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
