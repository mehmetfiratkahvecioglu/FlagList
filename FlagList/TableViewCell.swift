//
//  TableViewCell.swift
//  FlagList
//
//  Created by Fırat Kahvecioğlu on 19.07.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    

    @IBOutlet var imageCell: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageCell.layer.borderWidth = 1
        imageCell.layer.borderColor = UIColor(named: "black")?.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
