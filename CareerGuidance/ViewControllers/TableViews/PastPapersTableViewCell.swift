//
//  PastPapersTableViewCell.swift
//  CareerGuidance
//
//  Created by Murtaza on 14/05/2023.
//

import UIKit

class PastPapersTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var lblUniversityNames: UILabel!
    @IBOutlet weak var numberCircle: UIImageView!
    @IBOutlet weak var UniversityView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
