//
//  SideTableViewCell.swift
//  Holy-Bible
//
//  Created by Ragaie alfy on 7/24/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class SideTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageIcon: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
