//
//  PastPapersViewController.swift
//  CareerGuidance
//
//  Created by Murtaza on 14/05/2023.
//

import UIKit

class PastPapersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let universities = ["NED UNIVERSITY", "JINNAH UNIVERSITY", "IQRA UNIVERSITY", "KARACHI UNIVERSITY", "LUMS", "FAST-NU", "AGHAN KHAN UNIVERSITY", "SIR SYED UNIVERSITY"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 70
       
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
           swipeRight.direction = .right
           view.addGestureRecognizer(swipeRight)
    }
   
    @objc func swipedRight() {
        navigationController?.popViewController(animated: true)
    }
}
extension PastPapersViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "PastPapersTableViewCell", for: indexPath) as! PastPapersTableViewCell
        
        cell.lblNumber.text = "\(indexPath.row + 1)"
        cell.lblUniversityNames.text = universities[indexPath.row]
        return cell
        
    }
}
