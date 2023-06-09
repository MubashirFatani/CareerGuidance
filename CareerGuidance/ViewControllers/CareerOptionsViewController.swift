//
//  CareerOptionsViewController.swift
//  CareerGuidance
//
//  Created by Murtaza on 23/05/2023.
//

import UIKit

class CareerOptionsViewController: UIViewController {

    @IBOutlet weak var preEngView: UIView!
    @IBOutlet weak var preMedicalView: UIView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preEngView.layer.cornerRadius = 15
        preMedicalView.layer.cornerRadius = 15
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
           swipeRight.direction = .right
           view.addGestureRecognizer(swipeRight)
        
        setViews()
      
    }
    
    @objc func swipedRight() {
        navigationController?.popViewController(animated: true)
    }
    
    func setViews(){
        preEngView.layer.cornerRadius = 15
        preEngView.layer.cornerRadius = 15
        preEngView.layer.cornerRadius = 15
        
        preEngView.layer.borderColor = UIColor.gray.cgColor
        preEngView.layer.shadowColor = UIColor.gray.cgColor
        preEngView.layer.shadowOpacity = 0.5
        preEngView.layer.shadowRadius = 2.0
        preEngView.layer.shadowOffset = CGSize(width: 1, height: 0)
        
        preMedicalView.layer.borderColor = UIColor.gray.cgColor
        preMedicalView.layer.shadowColor = UIColor.gray.cgColor
        preMedicalView.layer.shadowOpacity = 0.5
        preMedicalView.layer.shadowRadius = 2.0
        preMedicalView.layer.shadowOffset = CGSize(width: 1, height: 0)
       
        
        
    }
    
    
    @IBAction func btnPreENgTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PreEngViewController")as! PreEngViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func btnPreMedTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PreMedicalViewController")as! PreMedicalViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
