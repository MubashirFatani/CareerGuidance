
import UIKit
import IQKeyboardManagerSwift
import TOCropViewController
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage

class ProfileViewController: UIViewController{
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var btnNo: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var txtFieldFullName: UITextField!
    @IBOutlet weak var txtFieldHSSC: UITextField!
    @IBOutlet weak var txtFieldInterest: UITextField!
    @IBOutlet weak var txtFieldPercentageHSSC: UITextField!
    @IBOutlet weak var txtFieldCore1: UITextField!
    @IBOutlet weak var txtfieldCore2: UITextField!
    @IBOutlet weak var txtfieldCore3: UITextField!
    @IBOutlet weak var lblEnterMarksCoreSubject: UILabel!
    @IBOutlet weak var core1View: UIView!
    @IBOutlet weak var core2View: UIView!
    @IBOutlet weak var core3View: UIView!
    
    let dropdownDelegate = DropdownPickerDelegate()
    let pickerView = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileView.layer.cornerRadius = profileView.frame.height/2
        
        
        pickerView.delegate = dropdownDelegate
        pickerView.dataSource = dropdownDelegate
        
        txtFieldHSSC.inputView = pickerView
        txtFieldInterest.inputView = pickerView
        
        
        txtFieldCore1.keyboardType = .numberPad
        txtfieldCore2.keyboardType = .numberPad
        txtfieldCore3.keyboardType = .numberPad
        txtFieldPercentageHSSC.keyboardType = .numberPad
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let HSSCdoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDone))
        toolbar.setItems([HSSCdoneButton], animated: true)
        
        txtFieldHSSC.inputAccessoryView = toolbar
        
        txtFieldHSSC.delegate = self
        
        //  marksHidden(hidden: true)
        
        let InterestdoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(interestDidTapDone))
        toolbar.setItems([InterestdoneButton], animated: true)
        
        txtFieldInterest.inputAccessoryView = toolbar
        txtFieldInterest.delegate = self
        
    }
    
    
    
    @objc func didTapDone() {
        let selectedRow = pickerView.selectedRow(inComponent: 0)
        txtFieldHSSC.text = dropdownDelegate.options[selectedRow]
        txtFieldHSSC.resignFirstResponder()
    }
    
    @objc func interestDidTapDone() {
        let selectedRow = pickerView.selectedRow(inComponent: 0)
        txtFieldInterest.text = dropdownDelegate.options[selectedRow]
        txtFieldInterest.resignFirstResponder()
    }
    
    
    
    @IBAction func btnNoClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnYesClicked(_ sender: UIButton) {
        
        if txtFieldFullName.text?.isEmpty ?? true || txtFieldInterest.text?.isEmpty ?? true || txtFieldHSSC.text?.isEmpty ?? true || txtFieldPercentageHSSC.text?.isEmpty ?? true || txtFieldCore1.text?.isEmpty == true || txtfieldCore2.text?.isEmpty == true || txtfieldCore3.text?.isEmpty == true{
            
            showAlert(AlertTytle: "Alert", AlertMessage: "Please provide all information")
        }
        else if (txtFieldCore1.text! <= "\(30)" && txtFieldCore1.text! > "\(100)" || txtfieldCore2.text! <= "\(30)" && txtfieldCore2.text! > "\(100)" || txtfieldCore3.text! <= "\(30)") && txtfieldCore3.text! > "\(100)"{
            
            showAlert(AlertTytle: "Alert", AlertMessage: "Your core subject marks are low or not applicable on the basis of which you cannot get admission in the university.")
        }
        
        else if (txtFieldPercentageHSSC.text! <= "\(30)") && txtFieldPercentageHSSC.text! > "\(100)" {
            
            showAlert(AlertTytle: "Alert", AlertMessage: "Your HSSC percentage is low or not applicable on the basis of which you cannot get admission in the university.")
            
        }
        
        else{
            let firebaseAuth = Auth.auth()
            let firebaseStore = Firestore.firestore()
            let storage = Storage.storage()
            var userProfileData = [
                "name": txtFieldFullName.text!,
                "interest": txtFieldInterest.text!,
                "HSSC":txtFieldHSSC.text!,
                "percentage_HSSC": txtFieldPercentageHSSC.text!,
                "isProfileComplete": true
            ] as [String : Any]
            
            let uid = firebaseAuth.currentUser?.uid ?? ""
            
            let imageData = imageView.image?.pngData() ?? Data()
            let reference  = storage.reference().child("DisplayPicture/\(uid).png")
            _ = reference.putData(imageData, metadata: nil) { (metadata, error) in
                guard metadata != nil else {
                    // Uh-oh, an error occurred!
                    return
                }
                
                reference.downloadURL { (url, error) in
                    
                    if error != nil {
                        //                        self.showAlert(AlertTytle: "Error", AlertMessage: error?.localizedDescription ?? error)
                    }else{
                        userProfileData["imageUrl"] = url
                    }
                    
                }
            }
            
            if(uid != ""){
                firebaseStore.collection("user").document(uid).setData(userProfileData, merge: true)
            }
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
            vc.image = imageView.image
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    @IBAction func btnEditTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        let alert = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == self.txtFieldHSSC {
            let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let preEngineeringAction = UIAlertAction(title: "Pre Engineering", style: .default) { _ in
                self.txtFieldHSSC.text = "Pre Engineering"
                self.marksHidden(hidden: false)
                self.txtFieldCore1.placeholder = "Maths"
                self.txtfieldCore2.placeholder = "Physics"
                self.txtfieldCore3.placeholder = "Chemistry"
            }
            
            let preMedicalAction = UIAlertAction(title: "Pre Medical", style: .default) { _ in
                self.txtFieldHSSC.text = "Pre Medical"
                self.marksHidden(hidden: false)
                self.txtFieldCore1.placeholder = "Biology"
                self.txtfieldCore2.placeholder = "Physics"
                self.txtfieldCore3.placeholder = "Chemistry"
            }
            
            let csAction = UIAlertAction(title: "Computer Science", style: .default) { _ in
                self.txtFieldHSSC.text = "Computer Science"
                self.marksHidden(hidden: false)
                self.txtFieldCore1.placeholder = "Computer"
                self.txtfieldCore2.placeholder = "Physics"
                self.txtfieldCore3.placeholder = "Maths"
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
                self.marksHidden(hidden: true)
                self.txtFieldHSSC.text = ""
            }
            
            alertController.addAction(preEngineeringAction)
            alertController.addAction(preMedicalAction)
            alertController.addAction(csAction)
            alertController.addAction(cancelAction)
            
            alertController.popoverPresentationController?.sourceView = textField
            alertController.popoverPresentationController?.sourceRect = textField.bounds
            
            present(alertController, animated: true, completion: nil)
            
            
            
            return false
        }
        if textField == self.txtFieldInterest{
            let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let ECATAction = UIAlertAction(title: "ECAT", style: .default) { _ in
                self.txtFieldInterest.text = "ECAT"
                
            }
            
            let MCATAction = UIAlertAction(title: "MCAT", style: .default) { _ in
                self.txtFieldInterest.text = "MCAT"
                
            }
            
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            
            
            alertController.addAction(ECATAction)
            alertController.addAction(MCATAction)
            alertController.addAction(cancelAction)
            
            alertController.popoverPresentationController?.sourceView = textField
            alertController.popoverPresentationController?.sourceRect = textField.bounds
            
            present(alertController, animated: true, completion: nil)
            
            
            
            return false
        }
        
        
        return true
    }
    
    func marksHidden(hidden: Bool){
        lblEnterMarksCoreSubject.isHidden = hidden
        txtFieldCore1.isHidden = hidden
        txtfieldCore2.isHidden = hidden
        txtfieldCore3.isHidden = hidden
        core1View.isHidden = hidden
        core2View.isHidden = hidden
        core3View.isHidden = hidden
    }
    
    
}
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: {
            if let image = info[.originalImage] as? UIImage{
                let cropViewController = TOCropViewController(image: image)
                cropViewController.delegate = self
                self.present(cropViewController, animated: true, completion: nil)
            }})
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

extension ProfileViewController: TOCropViewControllerDelegate{
    
    func cropViewController(_ cropViewController: TOCropViewController, didCropTo image: UIImage, with cropRect: CGRect, angle: Int) {
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        cropViewController.dismiss(animated: true, completion: nil)
    }
    
    func cropViewController(_ cropViewController: TOCropViewController, didFinishCancelled cancelled: Bool) {
        cropViewController.dismiss(animated: true, completion: nil)
    }
    
}



