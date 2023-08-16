//
//  ExtentionOfViewController.swift
//  CareerGuidance
//
//  Created by Murtaza on 25/03/2023.
//

import Foundation
import UIKit

extension UIViewController: UITextFieldDelegate{
    
    func showAlert(AlertTytle: String, AlertMessage: String){
         let alert = UIAlertController(title: AlertTytle, message: AlertMessage, preferredStyle: .alert)
        
         let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
         alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
     }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextTextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
       
        }
        return true
    }
        
    func pushToVC(withIdentifier identifier: String){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: identifier)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
