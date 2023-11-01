//
//  PreEngViewController.swift
//  CareerGuidance
//
//  Created by Murtaza on 23/05/2023.
//

import UIKit

class PreEngViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setFields()
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
           swipeRight.direction = .right
           view.addGestureRecognizer(swipeRight)
    }
    
    @objc func swipedRight() {
        navigationController?.popViewController(animated: true)
    }
    
    func setFields(){
        
        let fullText = "1: Mechanical Engineering\nMechanical engineering is one of the most diverse fields of engineering. Mechanical engineers create, develop, construct, and test products. From components to machines to the human body, they deal with everything that moves.\nMechanical engineering, in its most basic form, is the application of engineering ideas and problem-solving approaches to any product, from design through manufacture to the marketplace.\n2: Electrical Engineering\nElectrical engineering is the study and application of physics and mathematics, as well as aspects of electricity, electronics, and electromagnetic, to big and small-scale systems in order to process data and convey energy.\nElectrical engineering graduates work in fields such as energy, construction, manufacturing, transportation, telecommunications, engineering, and computers. Electrical engineers can operate in a variety of settings, including labs, offices, and construction sites, depending on their career level or project phase.\n3: Civil Engineering\nfields after fsc pre engineering Civil engineering is concerned with the built environment and may be traced back to the first time someone put a roof over their head or spanned a river with a tree trunk to make it simpler to cross.\nCivil engineers are responsible for much more than the design of buildings and bridges.\n They can be found in the aerospace industry, designing jetliners and space stations; in the automotive industry, perfecting a chassis’ load-carrying capacity and improving the crashworthiness of bumpers and doors; and in the shipbuilding, power, and many other industries where constructed facilities are involved.\n4: Computer Engineering\nComputer Engineering is a branch of engineering that creates hardware and firmware for a broad range of applications, including consumer electronics, medical equipment, communication systems, airplanes, and self-driving automobiles.\nDespite the very competitive industry, future computer engineers do not need to be concerned about work prospects. You’ll have a well-paid job that will grow in pay as you gain experience.\n5: Petroleum & Gas Engineering\nYou’ll learn about major industry issues including Formation Evaluation, Reservoir Engineering, and Reservoir Simulation while studying Petroleum and Gas Engineering.\nYou’ll learn to assess technologies for safe hydrocarbon oil and gas production and enhanced recovery, as well as emerging trends and technology that are driving the industry’s future, such as data science and artificial intelligence.\n6: Electronics Engineering\nElectronics engineering is the discipline of electrical engineering dealing with the use of electronic equipment such as integrated circuits and transistors, as well as the usage of the electromagnetic spectrum.\n7: BS in Computer Science & Information Technology\nSoftware, databases, and networking are among the topics covered in this program. Rather than stressing specific technologies, computer science degrees tend to focus on the mathematical and theoretical underpinnings of computers.\nPeople with good programming abilities, system analysis skills, and software testing skills are generally sought by software and information technology organizations.\nMany institutions provide instruction in the practical skills required to work as a software developer. Due to the importance of logical reasoning and critical thinking in becoming a software professional, this degree covers the whole software development process, from software design and development to final testing."
              
              let attributedString = NSMutableAttributedString(string: fullText)
              
              // Set bold font for the first line
              attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 17), range: (fullText as NSString).range(of: "1: Mechanical Engineering"))
        
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 17), range: (fullText as NSString).range(of: "2: Electrical Engineering"))
        
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 17), range: (fullText as NSString).range(of: "3: Civil Engineering"))
        
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 17), range: (fullText as NSString).range(of: "4: Computer Engineering"))
        
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 17), range: (fullText as NSString).range(of: "5: Petroleum & Gas Engineering"))
        
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 17),range: (fullText as NSString).range(of: "6: Electronics Engineering"))
        
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 17),range: (fullText as NSString).range(of: "7: BS in Computer Science & Information Technology"))
              
              textView.attributedText = attributedString
    }
    

  
}
