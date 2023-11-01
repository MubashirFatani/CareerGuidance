//
//  BooksViewController.swift
//  CareerGuidance
//
//  Created by Murtaza on 12/05/2023.
//

import UIKit


class BooksViewController: UIViewController {

    @IBOutlet weak var mcatView: UIView!
    @IBOutlet weak var ecatView: UIView!
    @IBOutlet weak var bcatView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
           swipeRight.direction = .right
           view.addGestureRecognizer(swipeRight)
    
        setViews()
    }
    
    @objc func swipedRight() {
        navigationController?.popViewController(animated: true)
    }
    
    func setViews(){
        ecatView.layer.cornerRadius = 15
        mcatView.layer.cornerRadius = 15
        bcatView.layer.cornerRadius = 15
        
        ecatView.layer.borderColor = UIColor.gray.cgColor
        ecatView.layer.shadowColor = UIColor.gray.cgColor
        ecatView.layer.shadowOpacity = 0.5
        ecatView.layer.shadowRadius = 2.0
        ecatView.layer.shadowOffset = CGSize(width: 1, height: 0)
        
        mcatView.layer.borderColor = UIColor.gray.cgColor
        mcatView.layer.shadowColor = UIColor.gray.cgColor
        mcatView.layer.shadowOpacity = 0.5
        mcatView.layer.shadowRadius = 2.0
        mcatView.layer.shadowOffset = CGSize(width: 1, height: 0)
        
        bcatView.layer.borderColor = UIColor.gray.cgColor
        bcatView.layer.shadowColor = UIColor.gray.cgColor
        bcatView.layer.shadowOpacity = 0.5
        bcatView.layer.shadowRadius = 2.0
        bcatView.layer.shadowOffset = CGSize(width: 1, height: 0)
        
        
    }
    
    @IBAction func btnEcatClicked(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EcatBooksViewController")as! EcatBooksViewController
            
        self.navigationController?.pushViewController(vc, animated: true)
            
        
    }
    @IBAction func btnMcatClicked(_ sender: UIButton) {
      pushToVC(withIdentifier: "McatViewController")
    }
    


}
