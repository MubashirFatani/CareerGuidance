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
        UniversityView.layer.cornerRadius = 20
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
//    @IBAction func btnUniversityTapped(_ sender: UIButton) {
//
//       guard let url = URL(string: "https://drive.google.com/uc?export=download&id=1rSI-u3U5ujbTVZQ43DBFpXRiTlAHSIHK")
//
//        else{
//            return
//        }
//        UIApplication.shared.open(url)
//    }
    
}
