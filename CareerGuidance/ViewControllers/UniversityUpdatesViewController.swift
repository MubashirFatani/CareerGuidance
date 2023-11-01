//
//  UniversityUpdatesViewController.swift
//  CareerGuidance
//
//  Created by Murtaza on 15/05/2023.
//

import UIKit
import CoreLocation
import MapKit

class UniversityUpdatesViewController: UIViewController {
    
    @IBOutlet weak var admissionView: UIView!
    @IBOutlet weak var programsView: UIView!
    @IBOutlet weak var locationView: UIView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        
        setViews()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()

    }
    @objc func swipedRight() {
        navigationController?.popViewController(animated: true)
    }
    
    func setViews(){
        admissionView.layer.cornerRadius = 15
        programsView.layer.cornerRadius = 15
        locationView.layer.cornerRadius = 15
        
        admissionView.layer.borderColor = UIColor.gray.cgColor
        admissionView.layer.shadowColor = UIColor.gray.cgColor
        admissionView.layer.shadowOpacity = 0.5
        admissionView.layer.shadowRadius = 2.0
        admissionView.layer.shadowOffset = CGSize(width: 1, height: 0)
        
        programsView.layer.borderColor = UIColor.gray.cgColor
        programsView.layer.shadowColor = UIColor.gray.cgColor
        programsView.layer.shadowOpacity = 0.5
        programsView.layer.shadowRadius = 2.0
        programsView.layer.shadowOffset = CGSize(width: 1, height: 0)
        
        locationView.layer.borderColor = UIColor.gray.cgColor
        locationView.layer.shadowColor = UIColor.gray.cgColor
        locationView.layer.shadowOpacity = 0.5
        locationView.layer.shadowRadius = 2.0
        locationView.layer.shadowOffset = CGSize(width: 1, height: 0)
        
        
    }
    @IBAction func btnLocationTapped(_ sender: UIButton) {
       locationManager.requestLocation()

    }
    @IBAction func btnUniversitiesData(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UniversityDataViewController")as! UniversityDataViewController
        vc.shouldShowAll = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension UniversityUpdatesViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
           if let location = locations.first {
               let latitude = location.coordinate.latitude
               let longitude = location.coordinate.longitude

               let searchQuery = "Universities"

               let encodedQuery = searchQuery.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
               let mapURLString = "http://maps.apple.com/?q=\(encodedQuery)&sll=\(latitude),\(longitude)&nearby=12"
               let mapURL = URL(string: mapURLString)!

               UIApplication.shared.open(mapURL, options: [:], completionHandler: nil)
           }
       }

       func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
           print("Failed to retrieve user's location: \(error.localizedDescription)")
       }

}
