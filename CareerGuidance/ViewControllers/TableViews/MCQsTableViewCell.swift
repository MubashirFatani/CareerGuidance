//
//  MCQsTableViewCell.swift
//  CareerGuidance
//
//  Created by Murtaza on 28/05/2023.
//

import UIKit

protocol MCQsTableViewCellDelegate: AnyObject {
    func answerViewTapped(ansOption: Int, indexPath: IndexPath)
}

class MCQsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblQuestion: UILabel!
    
    @IBOutlet weak var option1View: UIView!
    @IBOutlet weak var imgOption1: UIImageView!
    @IBOutlet weak var lblOption1: UILabel!
    
    @IBOutlet weak var option2View: UIView!
    @IBOutlet weak var imgOption2: UIImageView!
    @IBOutlet weak var lblOption2: UILabel!
    
    @IBOutlet weak var option3View: UIView!
    @IBOutlet weak var imgOption3: UIImageView!
    @IBOutlet weak var lblOption3: UILabel!
    
    @IBOutlet weak var option4View: UIView!
    @IBOutlet weak var imgOption4: UIImageView!
    @IBOutlet weak var lblOption4: UILabel!
    
    weak var delegate: MCQsTableViewCellDelegate?
    var indexPath = IndexPath()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        option1View.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(answer1Tapped)))
        option2View.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(answer2Tapped)))
        option3View.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(answer3Tapped)))
        option4View.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(answer4Tapped)))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func answer1Tapped() {
        self.delegate?.answerViewTapped(ansOption: 1, indexPath: indexPath)
    }
    
    @objc func answer2Tapped() {
        self.delegate?.answerViewTapped(ansOption: 2, indexPath: indexPath)
    }

    @objc func answer3Tapped() {
        self.delegate?.answerViewTapped(ansOption: 3, indexPath: indexPath)
    }
    
    @objc func answer4Tapped() {
        self.delegate?.answerViewTapped(ansOption: 4, indexPath: indexPath)
    }
}
