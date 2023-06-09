//
//  PreparationViewController.swift
//  CareerGuidance
//
//  Created by Murtaza on 12/05/2023.
//

import UIKit

class PreparationViewController: UIViewController {
    
    @IBOutlet weak var booksView: UIView!
    @IBOutlet weak var pastPaperView: UIView!
    
    
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
        booksView.layer.cornerRadius = 15
        pastPaperView.layer.cornerRadius = 15
        
        booksView.layer.borderColor = UIColor.gray.cgColor
        booksView.layer.shadowColor = UIColor.gray.cgColor
        booksView.layer.shadowOpacity = 0.5
        booksView.layer.shadowRadius = 2.0
        booksView.layer.shadowOffset = CGSize(width: 1, height: 0)
        
        pastPaperView.layer.borderColor = UIColor.gray.cgColor
        pastPaperView.layer.shadowColor = UIColor.gray.cgColor
        pastPaperView.layer.shadowOpacity = 0.5
        pastPaperView.layer.shadowRadius = 2.0
        pastPaperView.layer.shadowOffset = CGSize(width: 1, height: 0)
        
        
    }
    @IBAction func btnBooksClicked(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "BooksViewController") as! BooksViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btnPastPaperClicked(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PastPapersViewController") as! PastPapersViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
