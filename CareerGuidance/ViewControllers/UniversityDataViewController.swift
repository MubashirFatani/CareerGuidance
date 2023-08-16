//
//  UniversityDataViewController.swift
//  CareerGuidance
//
//  Created by Murtaza on 26/07/2023.
//

import UIKit
import FirebaseFirestore

class UniversityDataViewController: UIViewController{
    
    var universities = [UniversityData]()
    var shouldShowAll = false
    var studentPercentage: Double = 0.0
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUniversities()
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
    }
    
    @objc func swipedRight() {
        navigationController?.popViewController(animated: true)
    }
    
    func getUniversities() {
        
        let storage = Firestore.firestore()
        
        storage.collection("Universities").getDocuments { data, error in
            
            if let error = error {
                print("Error getting universities: \(error)")
                return
            }
            
            guard let universites = data?.documents else {
                print("No universities found")
                return
            }
            
            for university in universites {
                let universityData = university.data()
                
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: universityData, options: [])
                    let decoder = JSONDecoder()
                    let university = try decoder.decode(UniversityData.self, from: jsonData)
                    
                    if self.shouldShowAll {
                        self.universities.append(university)
                    }
                    
                    else {
                        if university.min_percent_required <= self.studentPercentage {
                            self.universities.append(university)
                            
                        }
                        if(self.studentPercentage <= 29){
                            
                            self.showAlert(AlertTytle: "Alert", AlertMessage: "You are not eligible to find universities based on your score.")
                        }
                    }
                    
                }
                
                catch {
                    print("Error decoding user: \(error)")
                }
            }
            
            self.tableView.reloadData()
        }
        
    }
    
}
extension UniversityDataViewController: UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UniversityDataTableViewCell", for: indexPath)as! UniversityDataTableViewCell
        
        cell.lblUniversityName.minimumScaleFactor = 0.5
        cell.lblDateOfAdmission.minimumScaleFactor = 0.5
        
        let university = universities[indexPath.row]
        cell.lblUniversityName.text = university.name
        cell.lblDateOfAdmission.text = university.admission_date
        cell.lblUniversityDescription.text = university.description
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
}
