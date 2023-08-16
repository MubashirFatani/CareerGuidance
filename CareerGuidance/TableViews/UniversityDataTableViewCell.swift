//
//  UniversityDataTableViewCell.swift
//  CareerGuidance
//
//  Created by Murtaza on 26/07/2023.
//

import UIKit

class UniversityDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblUniversityName: UILabel!
    @IBOutlet weak var lblDateOfAdmission: UILabel!
    @IBOutlet weak var lblUniversityDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }

}
