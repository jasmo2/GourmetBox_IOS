//
//  SingleCellTableViewCell.swift
//  SpoonBox
//
//  Created by Jaime Molina Orbe on 4/2/16.
//  Copyright © 2016 jasmo2. All rights reserved.
//
import UIKit

class SingleCellTableViewCell: UITableViewCell {

    @IBOutlet weak var cellText: UITextView!
    @IBOutlet weak var cellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
