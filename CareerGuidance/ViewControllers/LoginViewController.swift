//
//  LoginViewController.swift
//  CareerGuidance
//
//  Created by Murtaza on 18/03/2023.
//

import UIKit
import IQKeyboardManagerSwift
import FirebaseFirestore
import FirebaseAuth

class LoginViewController: UIViewController{

    @IBOutlet weak var lblLogin: UILabel!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPass: UITextField!
    @IBOutlet weak var btnForgotPass: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailView.layer.cornerRadius = 10
        passwordView.layer.cornerRadius = 10
        btnLogin.layer.cornerRadius = 10
        btnSignUp.layer.borderWidth = 2
        btnSignUp.layer.borderColor = UIColor.white.cgColor
        btnSignUp.layer.cornerRadius = 10
//      txtFieldEmail.delegate = self
//      txtFieldPass.delegate = self
       let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
           view.addGestureRecognizer(tapGesture)
    }
    
    @objc func viewTapped() {
        // Dismiss keyboard when tap outside text field
        view.endEditing(true)
    }

     func textFieldDidBeginEditing(_ textField: UITextField) {
        // Open keyboard when text field is tapped
        txtFieldPass.becomeFirstResponder()
    }
    
    @IBAction func btnSignUpClicked(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewCintroller") as! SignUpViewCintroller
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btnLoginClicked(_ sender: UIButton) {
        if(txtFieldEmail.text == ""){
            showAlert(AlertTytle: "Alert", AlertMessage: "Please enter a email")
        }
        else if !(Utility.isValid(email: txtFieldEmail.text!)){
            showAlert(AlertTytle: "Alert", AlertMessage: "Please enter a valid email")
        }
        else if(txtFieldPass.text == ""){
            showAlert(AlertTytle: "Alert", AlertMessage: "Please enter a password")
        }
        else if !(Utility.isValid(password: txtFieldPass.text!)){
            showAlert(AlertTytle: "Alert", AlertMessage: "Please enter atleast 4 digit password")
        }
        else{
            
            
                        UserDefaults.standard.setValue(txtFieldEmail.text!, forKey: "userEmail")
                       UserDefaults.standard.setValue(txtFieldPass.text!, forKey: "userPassword")
//            loginUserWithRequest()
            
            let firebaseAuth = Auth.auth()
            let firebaseStore = Firestore.firestore()
            do {
              try firebaseAuth.signOut()
            } catch let signOutError as NSError {
              print("Error signing out: %@", signOutError)
            }
            
            firebaseAuth.signIn(withEmail: txtFieldEmail.text!, password: txtFieldPass.text!) { result, error in

                if let err = error {
                    self.showAlert(AlertTytle: "Error", AlertMessage: err.localizedDescription)
                }
                else {
                    let uid = firebaseAuth.currentUser?.uid ?? "";
                    if(uid != ""){
                        firebaseStore.collection("user").document(uid).getDocument(completion: { data, err in
                            print(data?.data()! as Any)
                        })
                    }
                
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
                    self.navigationController?.pushViewController(vc, animated: true)

                }
            }
            
           
        }
    }
    @IBAction func btnForgotPasswordTapped(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    
}
