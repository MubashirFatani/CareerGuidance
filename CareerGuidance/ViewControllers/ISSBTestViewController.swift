

import UIKit

class ISSBTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
           swipeRight.direction = .right
           view.addGestureRecognizer(swipeRight)
    }
    

    @objc func swipedRight() {
        navigationController?.popViewController(animated: true)
    }

}
