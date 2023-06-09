//
//  MapViewController.swift
//  CareerGuidance
//
//  Created by Murtaza on 07/06/2023.
//

import UIKit
import GoogleMaps
import CoreLocation

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
    }
    
}

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            
            let query = "universities"
            let radius = 15000 // in meters
            
            let urlString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(latitude),\(longitude)&radius=\(radius)&keyword=\(query)&key=\(firebaseAPIKey)"
            // Replace YOUR_API_KEY with your actual Google Maps API key
            
            if let url = URL(string: urlString) {
                URLSession.shared.dataTask(with: url) { (data, _, error) in
                    guard let data = data, error == nil else {
                        print("Failed to fetch universities: \(error?.localizedDescription ?? "")")
                        return
                    }
                    
                    // Parse the data and extract the university locations
                    
                    DispatchQueue.main.async {
                        // Add markers for each university location on the map
                        // Customize the markers as needed
                        
                        // Set the camera position of the map view
                        
                    }
                }.resume()
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to retrieve user's location: \(error.localizedDescription)")
    }
    
}
