//
//  DashboardViewController.swift
//  CareerGuidance
//
//  Created by Murtaza on 11/05/2023.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var preparationView: UIView!
    @IBOutlet weak var AptitudeView: UIView!
    @IBOutlet weak var universityView: UIView!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var CareerView: UIView!
    @IBOutlet weak var ISSBView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var userImage: UIImageView!
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
           swipeRight.direction = .right
           view.addGestureRecognizer(swipeRight)
    }
    
    @objc func swipedRight() {
        navigationController?.popViewController(animated: true)
    }
    
    func setViews(){
        userImage.image = image
        userImage.layer.cornerRadius = 12 
        preparationView.layer.cornerRadius = 15
        universityView.layer.cornerRadius = 15
        scoreView.layer.cornerRadius = 15
        AptitudeView.layer.cornerRadius = 15
        CareerView.layer.cornerRadius = 15
        ISSBView.layer.cornerRadius = 15
        
        preparationView.layer.borderColor = UIColor.gray.cgColor
        preparationView.layer.shadowColor = UIColor.gray.cgColor
        preparationView.layer.shadowOpacity = 0.5
        preparationView.layer.shadowRadius = 2.0
        preparationView.layer.shadowOffset = CGSize(width: 1, height: 0)
        
        universityView.layer.borderColor = UIColor.gray.cgColor
        universityView.layer.shadowColor = UIColor.gray.cgColor
        universityView.layer.shadowOpacity = 0.5
        universityView.layer.shadowRadius = 2.0
        universityView.layer.shadowOffset = CGSize(width: 1, height: 0)
        
        scoreView.layer.borderColor = UIColor.gray.cgColor
        scoreView.layer.shadowColor = UIColor.gray.cgColor
        scoreView.layer.shadowOpacity = 0.5
        scoreView.layer.shadowRadius = 2.0
        scoreView.layer.shadowOffset = CGSize(width: 1, height: 0)
        
        AptitudeView.layer.borderColor = UIColor.gray.cgColor
        AptitudeView.layer.shadowColor = UIColor.gray.cgColor
        AptitudeView.layer.shadowOpacity = 0.5
        AptitudeView.layer.shadowRadius = 2.0
        AptitudeView.layer.shadowOffset = CGSize(width: 1, height: 0)
        
        CareerView.layer.borderColor = UIColor.gray.cgColor
        CareerView.layer.shadowColor = UIColor.gray.cgColor
        CareerView.layer.shadowOpacity = 0.5
        CareerView.layer.shadowRadius = 2.0
        CareerView.layer.shadowOffset = CGSize(width: 1, height: 0)
        
        ISSBView.layer.borderColor = UIColor.gray.cgColor
        ISSBView.layer.shadowColor = UIColor.gray.cgColor
        ISSBView.layer.shadowOpacity = 0.5
        ISSBView.layer.shadowRadius = 2.0
        ISSBView.layer.shadowOffset = CGSize(width: 1, height: 0)
    }
    
    @IBAction func btnPreparationTapped(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PreparationViewController")as! PreparationViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnAptitudeTapped(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AptitudeTestViewController")as! AptitudeTestViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnUniversityTapped(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UniversityUpdatesViewController")as! UniversityUpdatesViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnScoreTapped(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ScoreViewController")as! ScoreViewController
        vc.score = 79
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnCareerTapped(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CareerOptionsViewController")as! CareerOptionsViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnISSBTapped(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ISSBTestViewController")as! ISSBTestViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
