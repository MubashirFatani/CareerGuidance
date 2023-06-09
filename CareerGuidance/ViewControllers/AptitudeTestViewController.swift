//
//  IQTestViewController.swift
//  CareerGuidance
//
//  Created by Murtaza on 11/05/2023.
//

import UIKit

class AptitudeTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
           swipeRight.direction = .right
           view.addGestureRecognizer(swipeRight)
    }
    
    @objc func swipedRight() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnStartTapped(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MCQsViewController") as! MCQsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
