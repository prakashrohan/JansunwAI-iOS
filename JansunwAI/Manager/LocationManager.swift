//
//  LocationManager.swift
//  JansunwAI
//
//  Created by Rohan Prakash on 17/04/25.
//


import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    private let geocoder = CLGeocoder()

    @Published var location: CLLocationCoordinate2D?
    @Published var placeName: String? // <- Add this

    @Published var locationStatus: CLAuthorizationStatus?

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }

    func requestLocation() {
        let status = manager.authorizationStatus
        if status == .notDetermined {
            manager.requestWhenInUseAuthorization()
        } else if status == .authorizedWhenInUse || status == .authorizedAlways {
            manager.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationStatus = status
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            manager.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let loc = locations.first else { return }

        location = loc.coordinate
        manager.stopUpdatingLocation()

        // Reverse geocode to get place name
        geocoder.reverseGeocodeLocation(loc) { [weak self] placemarks, error in
            if let placemark = placemarks?.first {
                self?.placeName = [
                    placemark.name,
                    placemark.locality,
                    placemark.administrativeArea
                ]
                .compactMap { $0 }
                .joined(separator: ", ")
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get location: \(error)")
    }
}

