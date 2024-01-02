//
//  NewTableViewCell.swift
//  MVVMTEST
//
//  Created by Rajeshwari Sharma on 02/01/24.
//

import UIKit

class NewTableViewCell: UITableViewCell {
    @IBOutlet weak var Id: UILabel!
    @IBOutlet weak var CompleteLbl: UILabel!
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var UserName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
