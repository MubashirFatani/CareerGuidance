//
//  ForgotPasswordViewController.swift
//  CareerGuidance
//
//  Created by Murtaza on 22/04/2023.
//

import UIKit
import FirebaseAuth

class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var lblForgotPassword: UILabel!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
           swipeRight.direction = .right
           view.addGestureRecognizer(swipeRight)
    }
    
    @objc func swipedRight() {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func btnSubmitTapped(_ sender: UIButton) {
    
        if(txtFieldEmail.text == ""){
            showAlert(AlertTytle: "Alert", AlertMessage: "Please enter a email")
        }
        else if !(Utility.isValid(email: txtFieldEmail.text!)){
            showAlert(AlertTytle: "Alert", AlertMessage: "Please enter a valid email")
        }
        else{
            
            let firebaseAuth = Auth.auth()
            firebaseAuth.sendPasswordReset(withEmail: txtFieldEmail.text!) { error in
                
                if let err = error {
                    self.showAlert(AlertTytle: "Error", AlertMessage: err.localizedDescription)
                }
                else{
                    let alert = UIAlertController(title: "Check your Email", message: "Please check your email for password reset link!", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ok", style: .default) { action in
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "VerificationCodeViewController") as! VerificationCodeViewController
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                    alert.addAction(okAction)
                    self.present(alert, animated: true)

                }
            }
            
//            let alert = UIAlertController(title: "Check your Email", message: "Please check your email for password reset link!", preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "Ok", style: .default) { action in
////                let vc = self.storyboard?.instantiateViewController(withIdentifier: "VerificationCodeViewController") as! VerificationCodeViewController
////                self.navigationController?.pushViewController(vc, animated: true)
//            }
//            alert.addAction(okAction)
//            self.present(alert, animated: true)
        }
    }
    
}
