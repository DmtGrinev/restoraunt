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
    
    let centerViewInUserLocation: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let mapView: MKMapView = {
        let mapView = MKMapView()
        return mapView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        checkAuthorization()
        setupRestorauntPlacemark()
        setupCenterViewInUserLocation()
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
    func setupRestorauntPlacemark() {
        let location = "Тюмень, ул.Газовиков 6"
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location) { (placemarks, error) in
            if let error = error {
                print(error)
                return  // преобразовываем адрес в координаты на карте
            }
            guard let placemarks = placemarks else {return}
            let placemark = placemarks.first // точка одна, берем первый элемент массива (он один, но может быть несколько когда ищем через поиск)
            let annotation = MKPointAnnotation()
            annotation.title = "Название ресторана"
            annotation.subtitle = "Ресторан"  // ставим метку и подписи
            
            guard let placemarkLocation = placemark?.location else {return}
            annotation.coordinate = placemarkLocation.coordinate   // привязка анотаций к координатам
            self.mapView.showAnnotations([annotation], animated: true)
            self.mapView.selectAnnotation(annotation, animated: true) // аннотация "подробно"
        }
    }
}

private extension MapViewController {
    func setupCenterViewInUserLocation() {
        self.view.addSubview(centerViewInUserLocation)
        centerViewInUserLocation.setImage(UIImage(named: "Location"), for: .normal)
        centerViewInUserLocation.frame = CGRect(x: mapView.frame.midX,
                                                y: mapView.frame.midY,
                                                width: 30,
                                                height: 30)
        
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
