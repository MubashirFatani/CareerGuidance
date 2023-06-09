
import UIKit
import CryptoSwift

class VerificationCodeViewController: UIViewController {
    @IBOutlet weak var codeView: UIView!
    
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var txtFieldCode: UITextField!

    let code = Verificationcodegenerator.generateVerificationCode(length: 6)

    override func viewDidLoad() {
        super.viewDidLoad()
        txtFieldCode.keyboardType = .numberPad
       
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
           swipeRight.direction = .right
           view.addGestureRecognizer(swipeRight)
    }
    
    @objc func swipedRight() {
        navigationController?.popViewController(animated: true)
    }
   
    @IBAction func btnSubmitTapped(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CreateNewPasswordViewController") as! CreateNewPasswordViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
