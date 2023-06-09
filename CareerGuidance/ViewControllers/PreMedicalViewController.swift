//
//  PreMedicalViewController.swift
//  CareerGuidance
//
//  Created by Murtaza on 23/05/2023.
//

import UIKit

class PreMedicalViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fullText = "1: B.Sc. (Bachelor of Science)\nB.Sc. revolves around science. It is a four-year degree program with majors ranging from Zoology, Chemistry, mathematics, physics, and Botany.\n2: Bachelor of Medicine and Bachelor of Surgery (MBBS)\nMBBS is a five-year degree program that equips students with professional knowledge of medicine. Practical and theoretical learning is a part of MBBS. Students can practice medicine upon the completion of their MBBS. Students are required to complete a one-year house job to qualify as a doctor after completing MBBS. House job is essential to train them for real-life situations. Students are offered an insight into the practical world of medicine during their house job period.\n3: Doctor of Pharmacy (D. Pharmacy)\nRecognized by the Pakistan Medical and Dental Council, Pharmaceutical Council of Pakistan, and Higher Education Commission, D. Pharmacy is a five-year undergraduate program. There are ten semesters in D. Pharmacy, which guide students about pharmaceuticals. Students are eligible for a Pharmacy license after completing D. Pharmacy. You can also apply for the position of clinical pharmacist upon degree completion.\n4: Doctor of Physical Therapy (DPT)\nAnother five-year degree program in medicine is DPT. Students learn about the movement of the human body and aim to improve physical independence."
        
        let attributedString = NSMutableAttributedString(string: fullText)
        
        // Set bold font for the first line
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 17), range: (fullText as NSString).range(of: "1: B.Sc. (Bachelor of Science)"))
        
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 17), range: (fullText as NSString).range(of: "2: Bachelor of Medicine and Bachelor of Surgery (MBBS)"))
        
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 17), range: (fullText as NSString).range(of: "3: Doctor of Pharmacy (D. Pharmacy)"))
        
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 17), range: (fullText as NSString).range(of: "4: Doctor of Physical Therapy (DPT)"))
        
        textView.attributedText = attributedString
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        
    }
    
    
    @objc func swipedRight() {
        navigationController?.popViewController(animated: true)
    }
    
    
    
}
