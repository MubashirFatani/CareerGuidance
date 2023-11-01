//
//  ISSBPastPapersViewController.swift
//  CareerGuidance
//
//  Created by Murtaza on 08/09/2023.
//

import UIKit

class ISSBPastPapersViewController: UIViewController {

    @IBOutlet weak var btnPastPaper: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        
    }
    
    @objc func swipedRight() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnPastPapersTapped(_ sender: UIButton) {
        
        guard let url = URL(string: "https://drive.google.com/file/d/17YRsyvq9vVSgHB3KQHBLb9LBlYytNxrz/view") else {
            return
        }
        UIApplication.shared.open(url)
    }
    



}
