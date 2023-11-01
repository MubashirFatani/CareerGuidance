//
//  McatViewController.swift
//  CareerGuidance
//
//  Created by Murtaza on 10/07/2023.
//

import UIKit

class McatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        
    }
    @objc func swipedRight() {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func btnBiologyTapped(_ sender: UIButton) {
        guard let url = URL(string: "https://drive.google.com/file/d/11egYdmc2RyIc2ninBiUcCwx_3J5SB3iE/view?usp=share_link") else {
                    return
                }
                
                UIApplication.shared.open(url)
    }
    @IBAction func btnPhysicsTapped(_ sender: UIButton) {
        guard let url = URL(string: "https://drive.google.com/uc?export=download&id=13FpK_Mb0f73qi1K1GW6h7z0k6ko9L26N") else {
                    return
                }
                
                UIApplication.shared.open(url)
    }
    @IBAction func btnChemistryTapped(_ sender: UIButton) {
        guard let url = URL(string: "https://drive.google.com/uc?export=download&id=1BkV8CKw5yoGDptwtAu-rsXyZAbBs07SL") else {
                    return
                }
                
                UIApplication.shared.open(url)
    }
    @IBAction func btnEnglishTapped(_ sender: UIButton) {
        guard let url = URL(string: "https://drive.google.com/uc?export=download&id=1Ip1hmidrm0bmW0XCKKj-4jgNN911PMFJ") else {
                    return
                }
                
                UIApplication.shared.open(url)
    }
    

   

}
