//
//  LocationManager.swift
//  weatherDemo
//
//  Created by Sanya on 6/9/2022.
//

import Foundation
import CoreLocation
// we need to confirm some protocols to use location manager
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    // Creating an instance of CLLocationManager, the framework we use to get the coordinates
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    //everytime app is opened it will ask pop-up to grant access for location
    override init() {
        super.init()
        
        // Assigning a delegate to our CLLocationManager instance
        manager.delegate = self
    }
    
    // Requests the one-time delivery of the user’s current location, seehttps://developer.apple.com/documentation/corelocation/cllocationmanager/1620548-requestlocation
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    // Set the location coordinates to the location variable
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    
    // This function will be called if we run into an error
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
        isLoading = false
    }
}
