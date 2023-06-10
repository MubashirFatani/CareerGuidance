//
//  LoginViewController.swift
//  CareerGuidance
//
//  Created by Murtaza on 15/03/2023.
//

import UIKit
import Foundation
import IQKeyboardManagerSwift
import KeychainAccess
import FirebaseAuth
import FirebaseFirestore

class SignUpViewCintroller: UIViewController {

    @IBOutlet weak var usernameView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var confirmPasswordView: UIView!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnAlreadyAccount: UIButton!
    @IBOutlet weak var txtFeildUserName: UITextField!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var txtFieldConfirmPass: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        emailView.layer.cornerRadius = 10
        passwordView.layer.cornerRadius = 10
        usernameView.layer.cornerRadius = 10
        confirmPasswordView.layer.cornerRadius = 10
        btnSignUp.layer.cornerRadius = 10
        btnAlreadyAccount.layer.cornerRadius = 10
        
        btnAlreadyAccount.layer.borderColor = UIColor.white.cgColor
        btnAlreadyAccount.layer.borderWidth = 2
        
    }
    @IBAction func btnAlreadyAccountClicked(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btnSignupClicked(_ sender: UIButton) {
        if(txtFeildUserName.text == ""){
            showAlert(AlertTytle: "Alert", AlertMessage: "Please enter a user name")
        }
        else if (txtFieldEmail.text == ""){
            showAlert(AlertTytle: "ALert", AlertMessage: "Please enter a Email")
        }
        else if((txtFieldEmail.text != nil) != Utility.isValid(email: txtFieldEmail.text!)){
            showAlert(AlertTytle: "Alert", AlertMessage: "Please enter a valid email")
        }
        else if(txtFieldPassword.text == ""){
            showAlert(AlertTytle: "ALert", AlertMessage: "Please enter a Password")
        }
        else if((txtFieldPassword.text != nil) != Utility.isValid(password: txtFieldPassword.text!)){
            showAlert(AlertTytle: "Alert", AlertMessage: "Please enter atleast 6 digit password")
        }
        else if(txtFieldConfirmPass.text == ""){
            showAlert(AlertTytle: "ALert", AlertMessage: "Please confirm your password")
        }
        else if(txtFieldPassword.text != txtFieldConfirmPass.text){
            showAlert(AlertTytle: "ALert", AlertMessage: "Incorrect Password")
        }
        else{
            UserDefaults.standard.setValue(txtFieldEmail.text!, forKey: "userEmail")
            UserDefaults.standard.setValue(txtFieldPassword.text!, forKey: "userPassword")
            self.authUser()
        }
              
    }
    
    func authUser() {
        let firebaseAuth = Auth.auth()
        let firebaseStore = Firestore.firestore()
        firebaseAuth.createUser(withEmail: txtFieldEmail.text!, password: txtFieldPassword.text!) { result, error in
            
            if let err = error {
                self.showAlert(AlertTytle: "Error", AlertMessage: err.localizedDescription)
            }
            else {
            let userId = result?.user.uid ?? ""
                let user = ["username": self.txtFeildUserName.text!,
                            "email": self.txtFieldEmail.text!,
                            "isProfileComplete":false] as [String : Any]
                firebaseStore.collection("user").document(userId).setData(user)
                print(firebaseAuth.currentUser?.email ?? "")
                
            }
        }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
