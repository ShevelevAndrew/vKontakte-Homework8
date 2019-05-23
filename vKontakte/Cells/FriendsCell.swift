//
//  FriendsCell.swift
//  vKontakte
//
//  Created by Andrew on 23/05/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class FriendsCell: UITableViewCell {
    
    static let reuseIdentifier = "FriendsCell"
    
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var friendImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
