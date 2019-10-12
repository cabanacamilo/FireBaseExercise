//
//  TableViewUserCell.swift
//  FireBaseExercise
//
//  Created by Camilo Cabana on 10/12/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class TableViewUserCell: UITableViewCell {

    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var password: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
