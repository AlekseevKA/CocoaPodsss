//
//  TableViewCell.swift
//  TestCocoaPods
//
//  Created by Алексеев on 11.04.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var SecondNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var FirstNameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
