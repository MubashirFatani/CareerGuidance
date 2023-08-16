//
//  PastPapersViewController.swift
//  CareerGuidance
//
//  Created by Murtaza on 14/05/2023.
//

import UIKit

class PastPapersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let ecatUniversities = ["NED UNIVERSITY", "NUST UNIVERSITY", "FAST UNIVERSITY", "KARACHI UNIVERSITY", "SIR SYED UNIVERSITY", "DAWOOD UNIVERSITY"]
    
    let mcatUniversities = ["KMDC" , "SMBBMCL" , "Dow University of Health Science" , "PMC"]
    
    let ecatUrl = ["https://drive.google.com/uc?export=download&id=1rSI-u3U5ujbTVZQ43DBFpXRiTlAHSIHK" , "https://drive.google.com/uc?export=download&id=18oMHrTu-JDJVzERAQ1pbw8jYu8g1F5iD" , "https://drive.google.com/uc?export=download&id=1vHyK40nD0KE8LmPNe3pznWQmUn25b0yJ" , "https://drive.google.com/uc?export=download&id=1IpXIcm-tNUiEo8BdLacTPKNTut-UPZVv" , "https://drive.google.com/uc?export=download&id=16UxhSkSppJQievGo0noVMv3Abo9OOtLr" , "https://drive.google.com/uc?export=download&id=1E2crcqZ2kX63UU0wlZdHyY6sCqd-1o7h"]
    
    let mcatUrl = ["https://drive.google.com/uc?export=download&id=1boKs87fL-fWz-ntqJXK8KDdRyI72HJ1e" , "https://drive.google.com/uc?export=download&id=19GmL2guOCsl9Wyzy5gPDb9Dyo_VJ-zbO" , "https://drive.google.com/uc?export=download&id=113sLaULXTFoBuhHekFQ1os0cewqo9_j1" , "https://drive.google.com/uc?export=download&id=1cOg253hkfiGKkpk6bvL0ECJ4Z2i-AOmV"]
    
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

extension PastPapersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return section == 0 ? ecatUniversities.count : mcatUniversities.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PastPapersTableViewCell", for: indexPath) as! PastPapersTableViewCell
        
        cell.lblNumber.text = "\(indexPath.row + 1)"
        cell.lblUniversityNames.text = indexPath.section == 0 ? ecatUniversities[indexPath.row] : mcatUniversities[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let url = indexPath.section == 0 ? URL(string: ecatUrl[indexPath.row])! : URL(string: mcatUrl[indexPath.row])!
        UIApplication.shared.open(url)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "ECAT Universities" : "MCAT Universities"
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel!.font = UIFont(name: "Arial", size: 24)
            header.textLabel!.textColor = UIColor.black
        }
    }
    
}
