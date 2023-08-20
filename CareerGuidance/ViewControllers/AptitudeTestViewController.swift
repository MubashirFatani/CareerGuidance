//
//  IQTestViewController.swift
//  CareerGuidance
//
//  Created by Murtaza on 11/05/2023.
//

import UIKit

class AptitudeTestViewController: UIViewController {
    
    var hsscPercentage = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
           swipeRight.direction = .right
           view.addGestureRecognizer(swipeRight)
    }
    
    @objc func swipedRight() {
        navigationController?.popViewController(animated: true)
    }
    
    func showOptions() {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MCQsViewController") as! MCQsViewController
        if let hsscPercent = Double(hsscPercentage) {
            vc.hsscPercentage = hsscPercent
        }
        
        let alert = UIAlertController(title: "Aptitude Test", message: "Which test you want to give?", preferredStyle: .alert)
        
        let ecatOption = UIAlertAction(title: "ECAT", style: .default) { action in
            vc.testType = .ecat
            self.navigationController?.pushViewController(vc, animated: true)
        }
        let mcatOption = UIAlertAction(title: "MCAT", style: .default) { action in
            vc.testType = .mcat
            self.navigationController?.pushViewController(vc, animated: true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alert.addAction(ecatOption)
        alert.addAction(mcatOption)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }
    
    @IBAction func btnStartTapped(_ sender: UIButton) {
        showOptions()
    }

}
