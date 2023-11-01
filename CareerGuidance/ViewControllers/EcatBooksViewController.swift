//
//  EcatBooksViewController.swift
//  CareerGuidance
//
//  Created by Murtaza on 10/07/2023.
//

import UIKit

class EcatBooksViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        
        
    }
    
    @objc func swipedRight() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnMathsClick(_ sender: UIButton) {
        guard let url = URL(string: "https://drive.google.com/uc?export=download&id=1lkUI5vbio5WGYtNAvfbgMVblUy4gpbX0") else {
                   return
               }
               
               UIApplication.shared.open(url)
    }
    @IBAction func btnPhysicsClick(_ sender: UIButton) {
        guard let url = URL(string: "https://drive.google.com/uc?export=download&id=13FpK_Mb0f73qi1K1GW6h7z0k6ko9L26N") else {
                   return
               }
               
               UIApplication.shared.open(url)
    }
    @IBAction func btnChemistryClick(_ sender: UIButton) {
        guard let url = URL(string: "https://drive.google.com/uc?export=download&id=1BkV8CKw5yoGDptwtAu-rsXyZAbBs07SL") else {
                   return
               }
               
               UIApplication.shared.open(url)
    }
    @IBAction func btnEnglishClick(_ sender: UIButton) {
        guard let url = URL(string: "https://drive.google.com/uc?export=download&id=1Ip1hmidrm0bmW0XCKKj-4jgNN911PMFJ") else {
                   return
               }
               
               UIApplication.shared.open(url)
    }
    

   

}
