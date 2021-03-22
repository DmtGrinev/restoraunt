//
//  MapViewController.swift
//  restoraunt
//
//  Created by Tim Grinev on 22.03.2021.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    var locationManager = CLLocationManager()
    
    
    let mapView: MKMapView = {
        let mapView = MKMapView()
        return mapView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        checkAuthorization()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationEnabled()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.frame = view.bounds
    }
}
extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate{
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 5000, longitudinalMeters: 5000)
            mapView.setRegion(region, animated: true)
        }
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkAuthorization()
    }
}

private extension MapViewController {
    func setupMapView() {
        self.view.addSubview(mapView)
    }
}

private extension MapViewController {
    func checkLocationEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
        }else{
            let alert = UIAlertController(title: "Выключена служба геолокации", message: "Хотите включить?", preferredStyle: .alert)
            let settingsAction = UIAlertAction(title: "Настройки", style: .default) { (alert) in
                if let url = URL(string: "App-Prefs:root=LOCATION_SERVICES"){
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            alert.addAction(settingsAction)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
    }
    }
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
}

private extension MapViewController {
    func checkAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
        case .denied:
            print("TTTT")
            break
        case .restricted:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        @unknown default:
            fatalError()
        }
    }


}
