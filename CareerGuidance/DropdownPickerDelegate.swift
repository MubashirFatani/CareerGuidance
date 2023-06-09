

import Foundation
import UIKit

class DropdownPickerDelegate: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    let options = ["Pre Engineering", "Pre Medical", "Commerce"]
    
    // Number of columns in the picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Number of rows in the picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    // Title for each row in the picker view
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
}


