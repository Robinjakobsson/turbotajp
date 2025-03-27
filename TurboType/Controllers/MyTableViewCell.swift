//
//  MyTableViewCell.swift
//  TurboType
//
//  Created by Robin jakobsson on 2025-03-26.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    static let identifier = "myTableViewCell"

    @IBOutlet weak var customLabel: UILabel!
    @IBOutlet weak var customImageView: UIImageView!
    
    static func nib() -> UINib {
        return UINib(nibName: "MyTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
